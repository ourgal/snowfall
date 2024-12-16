args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "epr"
      "epub2txt2"
      "epubcheck"
      # keep-sorted end
    ];
  }
)
