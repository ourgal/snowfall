{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "fingerpaint";
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
      # keep-sorted end
    ];
  }
)
