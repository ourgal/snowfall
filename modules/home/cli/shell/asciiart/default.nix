{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "tuime";
    nixPkgs = [
      # keep-sorted start
      "boxes"
      "confetty"
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
