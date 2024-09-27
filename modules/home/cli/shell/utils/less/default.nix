{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "moar"
      "peep"
      # keep-sorted end
    ];
  }
)
