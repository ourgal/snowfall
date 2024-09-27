{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "moar"
      "most"
      "peep"
      # keep-sorted end
    ];
  }
)
