args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "facad";
    nixPkgs = "tree";
    enable = [
      # keep-sorted start
      "eza"
      # keep-sorted end
    ];
  }
)
