{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "git-cal"
      "git-fame"
      "git-heatgrid"
      "git-of-theseus"
      "gitcs"
      "repoblame"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "git-bars"
      "git-quick-stats"
      "git-sizer"
      "gitstats"
      "tokei"
      # keep-sorted end
    ];
  }
)
