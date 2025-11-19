{
  myPkgs = "termchat";
  nixPkgs = [
    # keep-sorted start
    "gurk-rs"
    "nchat"
    "toot"
    "toxic"
    # keep-sorted end
  ];
  enable = "tg";
}
