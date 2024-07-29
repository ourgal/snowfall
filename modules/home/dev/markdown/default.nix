{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = "mdformat";
    nodePkgs = "prettier";
    nixPkgs = [
      "autocorrect"
      "marksman"
    ];
  }
)
