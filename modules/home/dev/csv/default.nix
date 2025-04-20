{
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
    "csvtk"
    "dasel"
    "miller"
    "q-text-as-data"
    "qsv"
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
