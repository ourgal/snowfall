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
      "ipinfo"
      "nali"
      "q"
      "tcping-go"
      "whois"
      "wirelesstools"
    ];
  }
)
