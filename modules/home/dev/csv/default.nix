{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "miller"
      "tidy-viewer"
      "usql"
      "xsv"
      # keep-sorted end
    ];
  }
)
