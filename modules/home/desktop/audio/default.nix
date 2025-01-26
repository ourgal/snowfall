args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "alsa-utils"
      "audacity"
      "blanket"
      "easytag"
      "netease-cloud-music-gtk"
      "puddletag"
      "qpwgraph"
      "shortwave"
      "tageditor"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "easyeffects"
      # keep-sorted end
    ];
  }
)
