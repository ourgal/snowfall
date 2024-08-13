{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "figlet"
      "genact"
      "lolcat"
      "neo"
      "nyancat"
      "pipes"
      "tmatrix"
      # keep-sorted end
    ];
  }
)
