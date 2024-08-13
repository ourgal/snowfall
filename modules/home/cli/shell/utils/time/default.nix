{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "hyperfine"
      # keep-sorted end
    ];
  }
)
