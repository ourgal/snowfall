{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "chezmoi"
      "clifm"
      "sfm"
      "superfile"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "lf"
      "nnn"
      "ranger"
      "yazi"
      # keep-sorted end
    ];
  }
)
