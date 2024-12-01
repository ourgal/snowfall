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
      "rainfrog"
      "sql-studio"
      "sqruff"
      "usql"
      # keep-sorted end
    ];
  }
)
