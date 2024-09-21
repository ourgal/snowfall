{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "wiper";
    nixPkgs = [
      # keep-sorted start
      "diskus"
      "du-dust"
      "dua"
      "duc"
      "gdu"
      "ncdu"
      # keep-sorted end
    ];
  }
)
