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
      "fffuu" # Fancy Formal Firewall Universal Understander
      "gapcast"
      "gping"
      "httping"
      "impala"
      "ipinfo"
      "lychee"
      "mitmproxy"
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
