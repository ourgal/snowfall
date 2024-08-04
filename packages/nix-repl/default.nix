{ pkgs, ... }:
pkgs.writeScriptBin "nix-repl" ''
  #!/usr/bin/env nix-shell
  #!nix-shell -i expect -p expect
  spawn -noecho nix repl {*}$argv
  expect "nix-repl> " {
    send ":a builtins\n"
    interact
  }
''
