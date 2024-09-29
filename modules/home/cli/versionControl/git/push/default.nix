{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gickup"
      "git-upstream"
      "mob"
      # keep-sorted end
    ];
  }
)
