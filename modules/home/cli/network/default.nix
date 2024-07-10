{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
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
    ];
  }
)
