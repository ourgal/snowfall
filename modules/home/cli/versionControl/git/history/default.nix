args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-big-picture"
      "git-graph"
      "serie"
      # keep-sorted end
    ];
  }
)
