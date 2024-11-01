args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "await"
      "gnumake"
      "just"
      "mask"
      "mmake"
      "mprocs"
      "runme" # https://github.com/stateful/runme/issues/647#issuecomment-2327538200
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "cmdx"
      "machma"
      "makedown"
      "pls"
      "sake"
      # keep-sorted end
    ];
    enable = "pueue";
  }
)
