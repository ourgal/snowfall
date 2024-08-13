{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "emanote"
      "hledger"
      "hledger-ui"
      "hledger-web"
      "jrnl"
      "nb"
      "pandoc"
      # keep-sorted end
    ];
  }
)
