{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "tuime";
    nixPkgs = [
      # keep-sorted start
      "boxes"
      "figlet"
      "figurine"
      "genact"
      "lolcat"
      "neo"
      "nyancat"
      "peaclock"
      "pipes"
      "tmatrix"
      # keep-sorted end
    ];
  }
)
