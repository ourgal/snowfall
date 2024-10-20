args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "mdtt";
    nodePkgs = "prettier";
    nixPkgs = [
      # keep-sorted start
      "autocorrect"
      "marksman"
      "md-tangle"
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
