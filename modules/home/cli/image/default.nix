args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "dipc"
      "exiftool"
      "gifsicle"
      "graphicsmagick"
      "graphviz"
      "imagemagick"
      "imgp"
      "kcc"
      "lutgen"
      "menyoki"
      "pio"
      "pqiv"
      "qiv"
      "termshot"
      "viu"
      "xv"
      "yeetgif"
      # keep-sorted end
    ];
    myPkgs = [
      # keep-sorted start
      "Duplicate-Image-Finder"
      "autocrop"
      "gif-progress"
      "manga-tui"
      "rimage"
      "sprite-dicing"
      "svgshift"
      "textimg"
      # keep-sorted end
    ];
  }
)
