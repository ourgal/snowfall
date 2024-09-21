{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = "stremio";
    enable = [
      "freetube"
      "ytui"
      "mpv"
    ];
  }
)
