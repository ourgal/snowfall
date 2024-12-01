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
      "mycli"
      "sqruff"
      "usql"
      # keep-sorted end
    ];
  }
)
