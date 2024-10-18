args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "clifm"
      "fm-go"
      "sfm"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "chezmoi"
      "lf"
      "nnn"
      "ranger"
      "superfile"
      "xplr"
      "yazi"
      # keep-sorted end
    ];
  }
)
