{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "anki"
      "calibre"
      "evince"
      "goldendict-ng"
      "koreader"
      "libreoffice"
      "onlyoffice-bin"
      "zeal"
    ];
    enable = [
      "sioyek"
      "zathura"
    ];
  }
)
