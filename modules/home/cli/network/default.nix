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
      "dnspeep"
      "dogdns"
      "dstp"
      "gping"
      "httping"
      "ipinfo"
      "nali"
      "q"
      "tcping-go"
      "wget"
      "whois"
      "wirelesstools"
      # keep-sorted end
    ];
    enable = "bottom";
  }
)
