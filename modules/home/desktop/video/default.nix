args:
args.module (
  args
  // {
    path = ./.;
    nodePkgs = [
      # keep-sorted start
      "peerflix"
      # "webtorrent-cli"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "aegisub"
      "gifski"
      "gpu-screen-recorder"
      "kdenlive"
      "memento"
      "mpvc"
      "peek"
      "pipeline"
      "shotcut"
      "stremio"
      "vlc"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "freetube"
      "mpv"
      "ytui"
      # keep-sorted end
    ];
  }
)
