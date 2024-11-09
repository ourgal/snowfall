args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "await"
      "gnumake"
      "mask"
      "mmake"
      "mprocs"
      "nq"
      "runme" # https://github.com/stateful/runme/issues/647#issuecomment-2327538200
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "cdo"
      "cmdx"
      "machma"
      "makedown"
      "sake"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "just"
      "pueue"
      # keep-sorted end
    ];
  }
)
