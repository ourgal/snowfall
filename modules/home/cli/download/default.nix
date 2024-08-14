{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "baidupcs-go"
      "dra"
      # keep-sorted end
    ];
    nixPkgs = "libgen-cli";
    enable = [
      # keep-sorted start
      "aria2"
      "eget"
      "transmission"
      "yt-dlp"
      # keep-sorted end
    ];
  }
)
