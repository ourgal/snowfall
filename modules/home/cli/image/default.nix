{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "exiftool"
      "graphviz"
      "imagemagick"
      "viu"
    ];
    myPkgs = "autocrop";
  }
)
