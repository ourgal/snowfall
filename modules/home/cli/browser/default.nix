{
  myPkgs = "neonmodem";
  nixPkgs = [
    # keep-sorted start
    "amfora"
    "browsh"
    "circumflex"
    "links2"
    "w3m"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "brotab"
    "lynx"
    # keep-sorted end
  ];
}
