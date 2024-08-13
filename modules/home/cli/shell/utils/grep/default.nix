{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "ripgrep"
      "ugrep"
      # keep-sorted end
    ];
  }
)
