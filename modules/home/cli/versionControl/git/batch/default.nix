{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "fw"
      # keep-sorted end
    ];
  }
)
