args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "perlnavigator";
    perlPkgs = "Appcpanminus";
    files.".perlcriticrc" = ''[-Subroutines::ProhibitSubroutinePrototypes]'';
    enable = "global";
  }
)
