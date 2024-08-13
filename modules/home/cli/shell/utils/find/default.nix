{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "bfs"
      "fd"
      # keep-sorted end
    ];
  }
)
