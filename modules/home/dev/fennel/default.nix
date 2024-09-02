{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "antifennel";
    nixPkgs = [
      "fennel"
      "fennel-ls"
      "fnlfmt"
    ];
  }
)
