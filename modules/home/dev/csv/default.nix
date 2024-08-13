{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "csview"
      "csvquote"
      "miller"
      "tidy-viewer"
      "usql"
      "xsv"
      # keep-sorted end
    ];
  }
)
