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
      # keep-sorted end
    ];
  }
)
