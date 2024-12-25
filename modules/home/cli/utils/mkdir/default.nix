args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "mkcd"
      "treegen"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "gtree"
      "makejinja"
      # keep-sorted end
    ];
  }
)
