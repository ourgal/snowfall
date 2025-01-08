args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "cabal-install";
    confs."cabal" = ./config;
  }
)
