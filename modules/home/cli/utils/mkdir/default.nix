args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "treegen";
    nixPkgs = [
      # keep-sorted start
      "gtree"
      "makejinja"
      # keep-sorted end
    ];
  }
)
