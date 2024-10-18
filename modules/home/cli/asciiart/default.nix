args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "jalm"
      "tuime"
      # keep-sorted end
    ];
    pyPkgs = "tqdm";
    nixPkgs = [
      # keep-sorted start
      "boxes"
      "confetty"
      "doge"
      "figlet"
      "figurine"
      "genact"
      "hr"
      "kittysay"
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
