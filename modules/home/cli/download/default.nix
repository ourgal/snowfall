{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "baidupcs-go";
    nixPkgs = "libgen-cli";
    enable = [
      "aria2"
      "eget"
      "transmission"
      "yt-dlp"
    ];
  }
)
