args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "dra"
      "goodls"
      "imgboxdwl"
      # keep-sorted end
    ];
    pyPkgs = "downloader-cli";
    nixPkgs = [
      # keep-sorted start
      "baidupcs-go"
      "btfs"
      "libgen-cli"
      "lux"
      "tdl"
      "tremc"
      "xidel"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "aria2"
      "eget"
      "gallery-dl"
      "nyaa"
      "transmission"
      "yt-dlp"
      # keep-sorted end
    ];
  }
)
