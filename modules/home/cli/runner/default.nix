{
  path = ./.;
  nixPkgs = [
    # keep-sorted start
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
    "ahoy"
    "cdo"
    "cmdx"
    "machma"
    "makedown"
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
