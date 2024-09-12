{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "dblab";
    nixPkgs = [
      # keep-sorted start
      "beekeeper-studio"
      "gobang"
      "mycli"
      "usql"
      # keep-sorted end
    ];
  }
)
