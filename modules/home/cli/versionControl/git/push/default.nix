{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "git-upstream"
      "mob"
      # keep-sorted end
    ];
  }
)
