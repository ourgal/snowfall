{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "exiftool"
      "graphviz"
      "imagemagick"
      "menyoki"
      "termshot"
      "viu"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "autocrop"
      "pik"
      "rimage"
      # keep-sorted end
    ];
  }
)
