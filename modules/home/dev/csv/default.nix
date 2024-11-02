args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "bafi"
      "config-file-validator"
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
      "textql"
      "tidy-viewer"
      "usql"
      "visidata"
      "xsv"
      "zsv"
      # keep-sorted end
    ];
  }
)
