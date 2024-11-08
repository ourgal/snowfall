{ writers, perlPackages }:
writers.writePerl "find-buffer-path" { libraries = [ perlPackages.ListMoreUtils ]; } (
  builtins.readFile ./find-buffer-path.pl
)
