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
      "ghc"
      "haskell-language-server"
      "hlint"
      "ormolu"
      "shake"
      "stack"
      "stylish-haskell"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "cabal"
      "stack"
      # keep-sorted end
    ];
  }
)
