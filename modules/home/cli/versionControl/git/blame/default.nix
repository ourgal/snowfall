args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "git-playback"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "git-dive"
      # keep-sorted end
    ];
  }
)
