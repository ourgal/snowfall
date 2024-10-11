{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "edir"
      "mmv-go"
      "rnr"
      # keep-sorted end
    ];
  }
)
