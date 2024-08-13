{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "ruplacer"
      "sad"
      "sd"
      # keep-sorted end
    ];
  }
)
