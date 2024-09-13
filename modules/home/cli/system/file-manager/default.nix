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
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "lf"
      "nnn"
      "ranger"
      "superfile"
      "yazi"
      # keep-sorted end
    ];
  }
)
