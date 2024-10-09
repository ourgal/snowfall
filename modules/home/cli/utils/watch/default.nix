{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "rustywatch";
    nixPkgs = [
      # keep-sorted start
      "hwatch"
      "viddy"
      # keep-sorted end
    ];
  }
)
