{
  myPkgs = "roc-switch";
  nixPkgs = [
    # keep-sorted start
    "pamixer"
    "pulsemixer"
    # keep-sorted end
  ];
  enable = "pipewire";
}
