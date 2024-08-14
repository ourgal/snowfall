{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "dblab";
    nixPkgs = [
      # keep-sorted start
      "gobang"
      "litecli"
      "usql"
      "visidata"
      # keep-sorted end
    ];
  }
)
