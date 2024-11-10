args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "get_cert"
      "impala"
      "updo"
      "vl"
      # keep-sorted end
    ];
    haskellPkgs = "brok";
    nixPkgs = [
      # keep-sorted start
      "cidr-merger"
      "dig"
      "dnspeep"
      "dogdns"
      "dstp"
      "gping"
      "httping"
      "ipinfo"
      "lychee"
      "nali"
      "netop"
      "oha"
      "q"
      "tcping-go"
      "termshark"
      "trippy"
      "trurl"
      "wget"
      "whois"
      "wirelesstools"
      "wuzz"
      # keep-sorted end
    ];
    enable = "bottom";
  }
)
