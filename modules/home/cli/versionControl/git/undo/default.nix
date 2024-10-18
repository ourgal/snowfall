args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bfg-repo-cleaner"
      "git-filter-repo"
      # keep-sorted end
    ];
  }
)
