args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "serie";
    nixPkgs = [
      # keep-sorted start
      "git-big-picture"
      "git-graph"
      # keep-sorted end
    ];
  }
)
