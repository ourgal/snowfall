args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "cabal-install"
      "ghc"
      "haskell-language-server"
      "hlint"
      "ormolu"
      "stack"
      # keep-sorted end
    ];
  }
)
