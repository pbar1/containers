# containers

My automated container image builds. Generally, they'll adhere to a few loose
guidelines.

- Rootless
  - User/Group: `user:users`
  - UID/GID: `1000:100`
- Multi-platform
  - linux/amd64
  - linux/arm64

New images are built via GitHub Actions daily at 08:00 UTC and tagged `latest`.

## Nix Notes

- dotnet doc: https://github.com/NixOS/nixpkgs/blob/master/doc/languages-frameworks/dotnet.section.md
- Needed `nuget-to-nix` instead of `<package>.passthru.fetchdeps` due to the
  latter's inability to handle non-nuget-hosted deps
- Needed to remove wildcard from `AssemblyVersion` in `Directory.Build.props`.
  Can this just be passed manually via the flag `-p:AssemblyVersion=0.0.0.0`?
- Something about RID: https://github.com/dotnet/sdk/issues/14281
  ```
  error NETSDK1134: Building a solution with a specific RuntimeIdentifier is not supported. If you would like to publish for a single RID, specifiy the RID at the individual project level instead.
  ```
  Must change to build as a .csproj.
  - For the curious, here's how that is injected:
    https://github.com/NixOS/nixpkgs/blob/master/pkgs/build-support/dotnet/build-dotnet-module/hooks/dotnet-build-hook.sh
- Building as .csproj encounters error since the project references Windows
  stuff. Must pass the flag `-p:EnableWindowsTargeting=true` to at least the
  restore step, but also had to `rm -rf NzbDrone.Windows*`
  - Now that we know we were targeting the wrong project, try another build
    without having deleted the Windows dirs
  - `build.sh` was doing some removal of Windows dirs, but I think they may
    have been the output directories
- Wrong .csproj! Needed `NzbDrone.Console/Prowlarr.Console.csproj` instead of
  `Prowlarr/src/NzbDrone/Prowlarr.csproj`
- Now lots of style errors:
  `error SA1200: Using directive should appear within a namespace declaration`.
  Jellyfin fixes it like this:
  https://github.com/NixOS/nixpkgs/blob/master/pkgs/servers/jellyfin/disable-warnings.patch
  And here's the command that was running:
  ```
  env dotnet build src/NzbDrone.Console/Prowlarr.Console.csproj -maxcpucount:1 -p:BuildInParallel=false -p:ContinuousIntegrationBuild=true -p:Deterministic=true --configuration Release --no-restore -p:InformationalVersion=0.0.0 -p:Version=0.0.0.0 --runtime osx-arm64 -p:SelfContained=false -p:UseAppHost=true
  ```
  - Setting this build flag worked: `-p:WarningsNotAsErrors=SA1200`
  - https://learn.microsoft.com/en-us/dotnet/csharp/language-reference/compiler-options/errors-warnings
- [NIX_DEBUG = 7](https://www.reddit.com/r/NixOS/comments/14stdgy/how_to_make_nix_build_display_all_commands/)
  in the derivation is a godsend to trace the commands that are run
- `dotnet publish` must set an explicit platform - see how this can be set via
  the dotnet build hook:
  ```
  error NETSDK1129: The 'Publish' target is not supported without specifying a target framework. The current project targets multiple frameworks, you must specify the framework for the published application.
  ```
- Builds without self-contained, but doesn't launch because a dotnet runtime is
  not present. Self-contained works. Now on startup though it can't find file
  `<nix>/lib/prowlarr/Prowlarr.Mono.dll`
- (current state) Backend builds. Yarn build fails on obscure error like so:
  `Module not found: Error: Can't resolve 'react-dnd'`.
  - Maybe we can just copy the UI from a prebuilt dl or something, to unblock
