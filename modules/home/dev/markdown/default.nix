{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "mdtt";
    pyPkgs = "mdformat";
    nodePkgs = "prettier";
    nixPkgs = [
      # keep-sorted start
      "autocorrect"
      "marksman"
      # keep-sorted end
    ];
    enable = "zk";
  }
)
