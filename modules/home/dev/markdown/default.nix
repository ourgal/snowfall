{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "mdtt";
    pyPkgs = "mdformat";
    nodePkgs = "prettier";
    nixPkgs = [
      "autocorrect"
      "marksman"
    ];
  }
)
