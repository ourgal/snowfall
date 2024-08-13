{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "boxes"
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
