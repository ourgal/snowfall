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
      "sql-studio"
      "sqruff"
      "usql"
      "visidata"
      # keep-sorted end
    ];
  }
)
