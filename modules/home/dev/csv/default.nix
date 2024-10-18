args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "rsv";
    nixPkgs = [
      # keep-sorted start
      "csview"
      "csvquote"
      "dasel"
      "miller"
      "tidy-viewer"
      "usql"
      "visidata"
      "xsv"
      # keep-sorted end
    ];
  }
)
