args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "comigo"
      "fingerpaint"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "gimp"
      "nomacs"
      "qview"
      "sxiv"
      "viewnior"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "feh"
      "imv"
      "nitrogen"
      "wallpapers"
      # keep-sorted end
    ];
  }
)
