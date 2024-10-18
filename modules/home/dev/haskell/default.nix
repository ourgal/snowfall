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
      "stack"
      # keep-sorted end
    ];
  }
)
