{
  description = "Automated container builds";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";

    prowlarr = { url = "github:Prowlarr/Prowlarr/v1.10.5.4116"; flake = false; };
  };


  outputs = { self, nixpkgs, flake-utils, prowlarr }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};
        # pkgsLinux = nixpkgs.legacyPackages.x86_64-linux;

        prowlarrYarnCache = pkgs.fetchYarnDeps {
          yarnLock = "${prowlarr.outPath}/yarn.lock";
          hash = "sha256-Lzw2XCX2EXiETPaz6kHjoIj2bC8RPmg34ZZ07aUa4h4=";
        };

        prowlarrUi = pkgs.stdenv.mkDerivation {
          pname = "prowlarr-ui";
          version = "1.10.5.4116";
          src = prowlarr.outPath;

          nativeBuildInputs = with pkgs; [
            nodejs
            yarn
            yarn2nix-moretea.fixup_yarn_lock
          ];

          configurePhase = ''
            export HOME=$(mktemp -d)
          '';

          buildPhase = ''
            yarn config --offline set yarn-offline-mirror ${prowlarrYarnCache}
            fixup_yarn_lock yarn.lock
            yarn install --offline --frozen-lockfile --ignore-engines --ignore-scripts
            patchShebangs .
            yarn build
          '';

          installPhase = ''
            mkdir -p $out
            cp -R _output/UI $out
          '';
        };

        prowlarrPkg = pkgs.buildDotnetModule {
          pname = "prowlarr";
          version = "1.10.5.4116";
          src = prowlarr.outPath;

          dotnetBuildFlags = [ "-p:AssemblyVersion=1.10.5.4116" "-p:WarningsNotAsErrors=SA1200" ];
          dotnetInstallFlags = [ "--framework=net6.0" ];

          projectFile = [ "src/NzbDrone.Console/Prowlarr.Console.csproj" "src/NzbDrone.Mono/Prowlarr.Mono.csproj" ];
          nugetDeps = ./nix/prowlarr/nuget-deps.nix;

          dotnet-sdk = pkgs.dotnetCorePackages.sdk_6_0;
          dotnet-runtime = pkgs.dotnetCorePackages.runtime_6_0;

          selfContainedBuild = true;
          executables = [ "Prowlarr" ];
          runtimeDeps = [ pkgs.ffmpeg ];

          postInstall = ''
            cp -r ${prowlarrUi}/UI $out/lib/prowlarr/UI
          '';
        };
      in
      {
        packages = { prowlarr = prowlarrPkg; };
      }
    ); # END flake-utils
}
