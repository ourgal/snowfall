{
  myPkgs = [
    # keep-sorted start
    "bilix"
    "douyin-downloader"
    "dra"
    "imgboxdwl"
    "tstickers"
    # keep-sorted end
  ];
  myX86Pkgs = "dirdl";
  pyPkgs = "downloader-cli";
  nixPkgs = [
    # keep-sorted start
    "axel"
    "baidupcs-go"
    "btfs"
    "lftp"
    "libgen-cli"
    "lux"
    "mangal"
    "mloader"
    "pget"
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
    "manga"
    "nyaa"
    "raw_novel_illustrations"
    "rtorrent"
    "transmission"
    "yt-dlp"
    # keep-sorted end
  ];
}
