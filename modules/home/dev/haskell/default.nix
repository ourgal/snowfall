args:
args.module (
  args
  // {
    path = ./.;
    haskellPkgs = [
      # keep-sorted start
      "hasktags"
      "hindent"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "cabal-install"
      "ghc"
      "haskell-language-server"
      "hlint"
      "ormolu"
      "shake"
      "stack"
      "stylish-haskell"
      # keep-sorted end
    ];
  }
)
