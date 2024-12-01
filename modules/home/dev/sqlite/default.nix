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
      "harlequin"
      "litecli"
      "sqruff"
      "usql"
      "visidata"
      # keep-sorted end
    ];
  }
)
