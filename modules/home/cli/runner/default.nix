{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "mprocs";
    myPkgs = [
      # keep-sorted start
      "machma"
      "sake"
      # keep-sorted end
    ];
    enable = "pueue";
  }
)
