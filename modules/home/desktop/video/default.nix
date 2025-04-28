{
  nodePkgs = [
    # keep-sorted start
    "peerflix"
    # "webtorrent-cli"
    # keep-sorted end
  ];
  nixPkgs = [
    # keep-sorted start
    "aegisub"
    "gerbera"
    "gifski"
    "gpu-screen-recorder"
    "memento"
    "mpvc"
    "peek"
    "pipeline"
    "rygel"
    "shotcut"
    "stremio"
    "vlc"
    # keep-sorted end
  ];
  enable = [
    # keep-sorted start
    "freetube"
    "jellyfin-mpv-shim"
    "mpv"
    "ytui"
    # keep-sorted end
  ];
}
