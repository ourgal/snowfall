{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "emanote"
      "hledger"
      "hledger-ui"
      "hledger-web"
      "nb"
      "pandoc"
    ];
  }
)
