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
      "litecli"
      "sql-studio"
      "sqruff"
      "usql"
      "visidata"
      # keep-sorted end
    ];
  }
)
