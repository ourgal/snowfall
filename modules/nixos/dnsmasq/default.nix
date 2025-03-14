args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    mkOpt'
    cfgNixos
    switch
    ip
    mac
    lan
    ;
  cfg = cfgNixos config.${namespace} ./.;
  value = {
    services.dnsmasq = enabled // {
      settings = {
        port = if cfg.dns.enable then 53 else 0;
        # upstream DNS servers
        server = [ "223.5.5.5" ];
        # sensible behaviours
        domain-needed = true;
        bogus-priv = true;
        no-resolv = true;
        localise-queries = true;
        bind-dynamic = true;
        local-service = true;
        edns-packet-max = 1232;
        stop-dns-rebind = true;
        rebind-localhost-ok = true;

        dhcp-authoritative = true;

        # Cache dns queries.
        cache-size = 1000;

        dhcp-range = [
          "${lan}.100,${lan}.249,24h"
          "::f,::ff,constructor:${cfg.lan},ra-stateless"
        ];
        dhcp-option = [
          "3,${lan}.1" # gateway
          "6,${lan}.1" # dns
        ];
        dhcp-host = [
          "${mac.brix},${ip.brix},brix"
          "${mac.home},${ip.home},home"
          "${mac.onecloud},${ip.onecloud},onecloud"
          "${mac.nuc},${ip.nuc},nuc"
          "${mac.ct3003},${ip.ct3003},CT3003"
        ];
        interface = cfg.lan;

        # local domains
        local = "/lan/";
        domain = "lan";
        expand-hosts = true;

        no-hosts = false;
        address = "/router.lan/${lan}.1";
      };
    };
    networking.firewall = {
      allowedTCPPorts = [ 67 ];
      allowedUDPPorts = [ 67 ];
    };
  };
  extraOpts = {
    lan = mkOpt' lib.types.str "";
    dns = switch;
  };
  path = ./.;
  _args = {
    inherit
      value
      path
      args
      extraOpts
      ;
  };
in
nixosModule _args
