{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "impala"
      # keep-sorted end
    ];
    nixPkgs = [
      # keep-sorted start
      "dig"
      "dogdns"
      "dstp"
      "gping"
      "httping"
      "ipinfo"
      "nali"
      "q"
      "tcping-go"
      "whois"
      "wirelesstools"
      # keep-sorted end
    ];
    enable = "bottom";
  }
)
