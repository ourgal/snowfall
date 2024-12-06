args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "subtotxt";
    nixPkgs = [
      # keep-sorted start
      "ffmpeg-full"
      "mediainfo"
      # keep-sorted end
    ];
  }
)
