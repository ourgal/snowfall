{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "usql"
      "xsv"
      # keep-sorted end
    ];
  }
)
