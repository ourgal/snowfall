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
      "csvkit"
      "csvlens"
      "csvq"
      "csvquote"
      "dasel"
      "miller"
      "q-text-as-data"
      "sq"
      "tabiew"
      "tidy-viewer"
      "usql"
      "visidata"
      "xsv"
      # keep-sorted end
    ];
  }
)
