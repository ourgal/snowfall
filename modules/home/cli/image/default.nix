args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "exiftool"
      "gifsicle"
      "graphicsmagick"
      "graphviz"
      "imagemagick"
      "imgp"
      "lutgen"
      "menyoki"
      "pqiv"
      "qiv"
      "termshot"
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
