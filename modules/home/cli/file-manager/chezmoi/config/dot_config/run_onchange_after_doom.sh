#!/usr/bin/env bash
# hash {{ output "nix" "hash" "path" (joinPath .chezmoi.homeDir ".config/doom" | quote) | trim }}
cd doom || exit
make
