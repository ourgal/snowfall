args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "bafi"
      "rsv"
      # keep-sorted end
    ];
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
