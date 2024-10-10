{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "edir"
      "mmv-go"
      # keep-sorted end
    ];
  }
)
