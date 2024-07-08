{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    pyPkgs = "mdformat";
    nixPkgs = [
      "autocorrect"
      "marksman"
    ];
  }
)
