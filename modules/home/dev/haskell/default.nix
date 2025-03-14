args:
args.module (
  args
  // {
    path = ./.;
    files.".ghci" = ''
      :set prompt "λ "
    '';
    haskellPkgs = [
      # keep-sorted start
      "hasktags"
      "hindent"
      "implicit-hie"
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
