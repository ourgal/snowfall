args:
args.module (
  args
  // {
    path = ./.;
    haskellPkgs = "hindent";
    nixPkgs = [
      # keep-sorted start
      "cabal-install"
      "ghc"
      "haskell-language-server"
      "hlint"
      "ormolu"
      "stack"
      "stylish-haskell"
      # keep-sorted end
    ];
  }
)
