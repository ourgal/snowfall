args:
args.module (
  args
  // {
    path = ./.;
    myPkgs = [
      # keep-sorted start
      "impala"
      "vl"
      # keep-sorted end
    ];
    haskellPkgs = "brok";
    nixPkgs = [
      # keep-sorted start
      "dig"
      "dnspeep"
      "dogdns"
      "dstp"
      "gping"
      "httping"
      "ipinfo"
      "lychee"
      "nali"
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
