{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "tp"
      # keep-sorted end
    ];
    nixPkgs = "up";
  }
)
