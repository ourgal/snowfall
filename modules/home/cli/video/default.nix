args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "ffmpeg-full"
      "mediainfo"
      # keep-sorted end
    ];
  }
)
