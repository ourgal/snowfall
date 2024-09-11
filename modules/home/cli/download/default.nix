{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "baidupcs-go"
      "dra"
      "github-dir"
      # keep-sorted end
    ];
    pyPkgs = "downloader-cli";
    nixPkgs = [
      # keep-sorted start
      "libgen-cli"
      "tdl"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "aria2"
      "eget"
      "nyaa"
      "transmission"
      "yt-dlp"
      # keep-sorted end
    ];
  }
)
