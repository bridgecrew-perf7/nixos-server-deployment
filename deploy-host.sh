#!/usr/bin/env bash

set -euf -o pipefail

HERE="$(dirname "$(readlink -f "$0")")"
MODE="${1?Specify either test or switch to determine the mode of deployment}"

cd "$HERE" || exit 1

# copy the nix files from this repo to /etc/nixos
cp configuration.nix /etc/nixos/
cp -r services system users /etc/nixos/

# deploy host
nixos-rebuild "$MODE"
