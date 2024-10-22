args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "rustywatch";
    nixPkgs = [
      # keep-sorted start
      "funzzy"
      "hwatch"
      "viddy"
      "watchexec"
      "watchman"
      # keep-sorted end
    ];
  }
)
