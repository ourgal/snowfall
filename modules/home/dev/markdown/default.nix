{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = "zk";
    myPkgs = "mdtt";
    pyPkgs = "mdformat";
    nodePkgs = "prettier";
    nixPkgs = [
      "autocorrect"
      "marksman"
    ];
  }
)
