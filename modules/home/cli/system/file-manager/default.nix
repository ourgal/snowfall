{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "chezmoi"
      "clifm"
      "superfile"
    ];
    enable = [
      "lf"
      "nnn"
      "ranger"
      "yazi"
    ];
  }
)
