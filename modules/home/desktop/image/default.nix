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
      "viewnior"
      # keep-sorted end
    ];
    enable = "feh";
  }
)
