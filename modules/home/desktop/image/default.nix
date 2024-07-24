{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "fingerpaint";
    nixPkgs = [
      "gimp"
      "viewnior"
    ];
    enable = "feh";
  }
)
