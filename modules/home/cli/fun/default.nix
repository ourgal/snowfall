args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "aniweather"
      "datadash"
      "jalm"
      "paclear"
      "pyjokes"
      "tuime"
      # keep-sorted end
    ];
    pyPkgs = "tqdm";
    nixPkgs = [
      # keep-sorted start
      "boxes"
      "cfonts"
      "confetty"
      "cowsay"
      "doge"
      "figlet"
      "figurine"
      "fortune"
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
      "ponysay"
      "tmatrix"
      "toilet"
      # keep-sorted end
    ];
  }
)
