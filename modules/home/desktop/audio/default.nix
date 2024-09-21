{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "alsa-utils"
      "blanket"
      "netease-cloud-music-gtk"
      "qpwgraph"
      "shortwave"
      # keep-sorted end
    ];
    enable = "easyeffects";
  }
)
