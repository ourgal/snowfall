args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "alsa-utils"
      "blanket"
      "eartag"
      "easytag"
      "netease-cloud-music-gtk"
      "puddletag"
      "qpwgraph"
      "shortwave"
      "tageditor"
      # keep-sorted end
    ];
    enable = "easyeffects";
  }
)
