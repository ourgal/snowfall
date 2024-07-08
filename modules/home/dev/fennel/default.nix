{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "fennel"
      "fennel-ls"
      "fnlfmt"
    ];
  }
)
