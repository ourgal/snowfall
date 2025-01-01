args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "beekeeper-studio"
      "dbgate"
      "dblab"
      "gobang"
      "harlequin"
      "lazysql"
      "mycli"
      "sql-studio"
      "sqruff"
      "usql"
      # keep-sorted end
    ];
  }
)
