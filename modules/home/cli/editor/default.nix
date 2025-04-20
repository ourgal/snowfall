{
  path = ./.;
  myPkgs = "v";
  nixPkgs = [
    # keep-sorted start
    "micro"
    "ox"
    "vimer"
    "vis"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "helix"
    "kakoune"
    "ki"
    "nixvim"
    "vim"
    # keep-sorted end
  ];
}
