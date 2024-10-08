{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "glow";
    myPkgs = "reader";
    enable = "ov";
  }
)
