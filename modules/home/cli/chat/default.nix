{
  myPkgs = "termchat";
  nixPkgs = [
    # keep-sorted start
    "nchat"
    "toot"
    "toxic"
    # keep-sorted end
  ];
  enable = "tg";
}
