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
      "trippy"
      "wget"
      "whois"
      "wirelesstools"
      "wuzz"
      # keep-sorted end
    ];
    enable = "bottom";
  }
)
