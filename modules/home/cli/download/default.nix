args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "bilix"
      "dirdl"
      "douyin-downloader"
      "dra"
      "goodls"
      "imgboxdwl"
      "musicdl"
      "tstickers"
      # keep-sorted end
    ];
    pyPkgs = "downloader-cli";
    nixPkgs = [
      # keep-sorted start
      "baidupcs-go"
      "btfs"
      "libgen-cli"
      "lux"
      "mangal"
      "mloader"
      "tdl"
      "tremc"
      "wget"
      "wget2"
      "xidel"
      # keep-sorted end
    ];
    enable = [
      # keep-sorted start
      "aria2"
      "eget"
      "gallery-dl"
      "nyaa"
      "raw_novel_illustrations"
      "rtorrent"
      "transmission"
      "yt-dlp"
      # keep-sorted end
    ];
  }
)
