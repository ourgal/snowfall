{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "bluetuith";
    myPkgs = [
      # keep-sorted start
      "blendr"
      "bluetui"
      # keep-sorted end
    ];
  }
)
