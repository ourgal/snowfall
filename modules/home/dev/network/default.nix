args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "cidr"
      "dnspyre"
      "get_cert"
      "hssp"
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
      "gapcast"
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
