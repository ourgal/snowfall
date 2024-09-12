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
      "litecli"
      "usql"
      "visidata"
      # keep-sorted end
    ];
  }
)
