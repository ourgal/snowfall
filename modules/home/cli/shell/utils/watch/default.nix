{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "hwatch"
      "viddy"
      # keep-sorted end
    ];
  }
)
