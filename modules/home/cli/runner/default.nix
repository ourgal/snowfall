{
  nixPkgs = [
    # keep-sorted start
    "ahoy"
    "await"
    "gnumake"
    "mask"
    "mmake"
    "mprocs"
    "runme" # https://github.com/stateful/runme/issues/647#issuecomment-2327538200
    # keep-sorted end
  ];
  myPkgs = [
    # keep-sorted start
    "cdo"
    "machma"
    "makedown"
    "multiplex"
    "pryrite"
    "sake"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "dela"
    "just"
    "pueue"
    # keep-sorted end
  ];
}
