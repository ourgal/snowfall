{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "await"
      "mprocs"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "machma"
      "sake"
      # keep-sorted end
    ];
    enable = "pueue";
  }
)
