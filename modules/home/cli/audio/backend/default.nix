{
  myX86Pkgs = "roc-switch";
  nixPkgs = [
    # keep-sorted start
    "alsa-utils"
    "pamixer"
    "pulsemixer"
    # keep-sorted end
  ];
  enable = "pipewire";
}
