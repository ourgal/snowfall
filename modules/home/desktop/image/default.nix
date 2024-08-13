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
      "viewnior"
      # keep-sorted end
    ];
    enable = "feh";
  }
)
