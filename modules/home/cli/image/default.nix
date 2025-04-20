{
  nixPkgs = [
    # keep-sorted start
    "dipc"
    "exiftool"
    "gifsicle"
    "gowall"
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
    "autocrop"
    "duplicate-image-finder"
    "gif-progress"
    "manga-tui"
    "sprite-dicing"
    "svgshift"
    "textimg"
    # keep-sorted end
  ];
  disable = "md2png";
}
