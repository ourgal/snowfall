{ pkgs }:
pkgs.writers.writePerl "find-buffer-path" { libraries = [ pkgs.perlPackages.ListMoreUtils ]; } (
  builtins.readFile ./find-buffer-path.pl
)
