{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "git-issue"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "git-bug"
      # keep-sorted end
    ];
  }
)
