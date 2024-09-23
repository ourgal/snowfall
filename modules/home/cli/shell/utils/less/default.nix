{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "peep"
      # keep-sorted end
    ];
  }
)
