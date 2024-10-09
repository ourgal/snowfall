{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "gifski"
      "mpvc"
      "peek"
      "stremio"
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
