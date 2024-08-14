{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gobang"
      "litecli"
      "usql"
      "visidata"
      # keep-sorted end
    ];
  }
)
