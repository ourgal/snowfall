{
  myPkgs = "ehh";
  myX86Pkgs = "corgi";
  nixPkgs = [
    # keep-sorted start
    "hoard"
    "nap"
    "the-way"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "navi"
    "pet"
    # keep-sorted end
  ];
}
