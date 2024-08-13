{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      "baidupcs-go"
      "dra"
    ];
    nixPkgs = "libgen-cli";
    enable = [
      "aria2"
      "eget"
      "transmission"
      "yt-dlp"
    ];
  }
)
