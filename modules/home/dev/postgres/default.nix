args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "dblab";
    nixPkgs = [
      # keep-sorted start
      "beekeeper-studio"
      "gobang"
      "usql"
      # keep-sorted end
    ];
  }
)
