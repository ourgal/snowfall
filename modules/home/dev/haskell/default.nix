{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "cabal-install"
      "ghc"
      "haskell-language-server"
      "stack"
    ];
  }
)
