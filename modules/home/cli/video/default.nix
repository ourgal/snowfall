{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "ffmpeg-full"
      "mediainfo"
    ];
  }
)
