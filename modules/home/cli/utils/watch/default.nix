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
      # keep-sorted end
    ];
  }
)
