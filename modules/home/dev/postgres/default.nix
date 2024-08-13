{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "usql"
      # keep-sorted end
    ];
  }
)
