{
  path = ./.;
  myPkgs = "rustywatch";
  nixPkgs = [
    # keep-sorted start
    "funzzy"
    "hwatch"
    "reflex"
    "viddy"
    "watchexec"
    "watchman"
    # keep-sorted end
  ];
}
