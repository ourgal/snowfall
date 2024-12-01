args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bfg-repo-cleaner"
      "git-filter-repo"
      "ugit"
      # keep-sorted end
    ];
  }
)
