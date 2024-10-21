args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "calibre"
      "evince"
      "goldendict-ng"
      "koreader"
      "libreoffice"
      "onlyoffice-bin"
      "zeal"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "sioyek"
      "zathura"
      # keep-sorted end
    ];
  }
)
