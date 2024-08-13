{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "miller"
      "usql"
      "xsv"
      # keep-sorted end
    ];
  }
)
