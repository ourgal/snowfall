{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "mmv-go"
      # keep-sorted end
    ];
  }
)
