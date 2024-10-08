{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      # keep-sorted start
      "asciinema"
      "ffmpeg-full"
      "mediainfo"
      # keep-sorted end
    ];
  }
)
