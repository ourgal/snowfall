{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "dblab";
    nixPkgs = [
      # keep-sorted start
      "gobang"
      "mycli"
      "usql"
      # keep-sorted end
    ];
  }
)
