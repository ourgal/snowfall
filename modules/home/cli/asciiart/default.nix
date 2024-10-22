args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "datadash"
      "jalm"
      "paclear"
      "tuime"
      # keep-sorted end
    ];
    pyPkgs = "tqdm";
    nixPkgs = [
      # keep-sorted start
      "boxes"
      "cfonts"
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
      "pipes-rs"
      "tmatrix"
      "toilet"
      # keep-sorted end
    ];
  }
)
