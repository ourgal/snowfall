#!/usr/bin/env bash
# hash {{ output "nix" "hash" "path" (joinPath .chezmoi.homeDir ".config/doom" | quote) | trim }}
if ! command -v emacs >/dev/null; then
  echo 'emacs is not installed'
  exit
fi
cd doom || exit
make
