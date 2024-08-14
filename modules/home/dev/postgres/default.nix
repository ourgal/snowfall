{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "dblab";
    nixPkgs = [
      # keep-sorted start
      "gobang"
      "usql"
      # keep-sorted end
    ];
  }
)
