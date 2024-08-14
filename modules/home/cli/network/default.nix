{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = "impala";
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
  }
)
