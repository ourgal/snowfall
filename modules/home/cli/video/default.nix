args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "ffhevc"
      "subtotxt"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "ffmpeg-full"
      "mediainfo"
      # keep-sorted end
    ];
  }
)
