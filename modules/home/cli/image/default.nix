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
