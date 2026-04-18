{
  myPkgs = "v";
  X86Pkgs = "fresh";
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
    "vim"
    # keep-sorted end
  ];
}
