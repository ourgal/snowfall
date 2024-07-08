{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "iosevka"
      "fira-code"
      "font-awesome"
      "joypixels"
      "nerdfonts"
    ];
  }
)
