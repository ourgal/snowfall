args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "mdtt"
      "textpod"
      # keep-sorted end
    ];
    nodePkgs = "prettier";
    nixPkgs = [
      # keep-sorted start
      "autocorrect"
      "cbfmt"
      "lowdown"
      "marksman"
      "md-tangle"
      "mdbook"
      "vale"
      "vale-ls"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "mdformat"
      "zk"
      # keep-sorted end
    ];
  }
)
