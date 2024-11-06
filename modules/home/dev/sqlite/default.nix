args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "beekeeper-studio"
      "dblab"
      "gobang"
      "litecli"
      "usql"
      "visidata"
      # keep-sorted end
    ];
  }
)
