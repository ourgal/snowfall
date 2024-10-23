args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "antiword"
      "catdoc"
      "frogmouth"
      "glow"
      "mdcat"
      # keep-sorted end
    ];
    myPkgs = "reader";
    enable = "ov";
  }
)
