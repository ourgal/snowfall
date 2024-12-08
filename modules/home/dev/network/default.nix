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
      "updo"
      "vl"
      # keep-sorted end
    ];
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
      "impala"
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
