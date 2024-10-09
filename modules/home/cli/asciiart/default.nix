{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "tuime";
    pyPkgs = "tqdm";
    nixPkgs = [
      # keep-sorted start
      "boxes"
      "confetty"
      "doge"
      "figlet"
      "figurine"
      "genact"
      "krabby"
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
