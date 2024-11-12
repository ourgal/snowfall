args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "baidupcs-go"
      "dra"
      "goodls"
      "imgboxdwl"
      # keep-sorted end
    ];
    pyPkgs = "downloader-cli";
    nixPkgs = [
      # keep-sorted start
      "btfs"
      "libgen-cli"
      "lux"
      "tdl"
      "tremc"
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
