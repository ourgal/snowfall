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
    myPkgs = [
      # keep-sorted start
      "baca"
      "reader"
      # keep-sorted end
    ];
    enable = "ov";
  }
)
