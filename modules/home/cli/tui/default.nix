{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "rat";
    nixPkgs = "smenu";
    enable = "lazycli";
  }
)
