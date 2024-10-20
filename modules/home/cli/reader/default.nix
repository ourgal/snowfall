args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "glow"
      "mdcat"
      # keep-sorted end
    ];
    myPkgs = "reader";
    enable = "ov";
  }
)
