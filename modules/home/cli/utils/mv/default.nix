{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "edir"
      "f2"
      "mmv-go"
      "rnr"
      # keep-sorted end
    ];
  }
)
