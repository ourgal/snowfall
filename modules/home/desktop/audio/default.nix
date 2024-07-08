{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "alsa-utils"
      "blanket"
      "qpwgraph"
    ];
    enable = "easyeffects";
  }
)
