#!/usr/bin/env nix-shell
#!nix-shell --packages nuget-to-nix dotnet-sdk

# FIXME: Make this part of a passthru on the actual package, since for now it
# doesn't actually run properly

set -euo pipefail

cd "$(dirname $0)"

git clone https://github.com/Prowlarr/Prowlarr.git || true
cd Prowlarr
git checkout v1.10.5.4116

cd src
mkdir -p packages

dotnet restore --packages packages
nuget-to-nix packages >../../nuget-deps.nix
