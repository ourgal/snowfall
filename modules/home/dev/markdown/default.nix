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
      "lowdown"
      "marksman"
      "md-tangle"
      "mdbook"
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
