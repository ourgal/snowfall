args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "antiword"
      "glow"
      "mdcat"
      # keep-sorted end
    ];
    myPkgs = "reader";
    enable = "ov";
  }
)
