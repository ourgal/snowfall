{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "exiftool"
      "graphicsmagick"
      "graphviz"
      "imagemagick"
      "menyoki"
      "termshot"
      "vhs"
      "viu"
      "yeetgif"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "autocrop"
      "manga-tui"
      "pik"
      "rimage"
      "svgshift"
      # keep-sorted end
    ];
  }
)
