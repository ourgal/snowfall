{
  nixPkgs = [
    # keep-sorted start
    "tty-clock"
    "world-wall-clock"
    # keep-sorted end
  ];
  myPkgs = "clock-tui";
  enable = "clock-rs";
}
