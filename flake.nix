{
  description = "Automated container builds";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";

    prowlarr = {
      # url = "github:Prowlarr/Prowlarr";
      url = "path:./Prowlarr";
      flake = false;
    };
  };


  outputs = { self, nixpkgs, prowlarr }:
    let
      pkgs = nixpkgs.legacyPackages."aarch64-darwin";
    in
    {
      # https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/dotnet.section.md
      # https://wuffs.org/blog/joining-the-nixos-pyramid-scheme
      packages.aarch64-darwin.prowlarr =
        let
          ui = pkgs.mkYarnPackage {
            pname = "prowlarr-ui";
            version = "0.0.0";
            src = prowlarr.outPath;

            buildPhase = ''
              yarn --offline build
            '';

            installPhase = ''
              mkdir -p $out
              cp -R _output/UI $out
            '';

            distPhase = "true";

            NIX_DEBUG = 7;
          };
        in
        pkgs.buildDotnetModule {
          pname = "prowlarr";
          version = "0.0.0";
          src = prowlarr.outPath;

          # dotnetRestoreFlags = [ "-p:EnableWindowsTargeting=true" ];
          dotnetBuildFlags = [ "-p:WarningsNotAsErrors=SA1200" ];
          dotnetInstallFlags = [ "--framework=net6.0" ];

          # projectFile = "src/Prowlarr.sln";
          # projectFile = "src/NzbDrone.Console/Prowlarr.Console.csproj";
          projectFile = [ "src/NzbDrone.Console/Prowlarr.Console.csproj" "src/NzbDrone.Mono/Prowlarr.Mono.csproj" ];
          nugetDeps = ./nix/prowlarr-deps.nix;

          dotnet-sdk = pkgs.dotnetCorePackages.sdk_6_0;
          dotnet-runtime = pkgs.dotnetCorePackages.runtime_6_0;

          selfContainedBuild = true;
          executables = [ "Prowlarr" ];
          runtimeDeps = [ pkgs.ffmpeg ];

          postInstall = ''
            install ${ui}/UI $out/lib/prowlarr/UI
          '';
        };
    };
}
