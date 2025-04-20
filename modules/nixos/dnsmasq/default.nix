args:
let
  inherit (args)
    namespace
    lib
    config
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    mkOpt'
    cfgNixos
    switch
    ip
    mac
    lan
    getDirname
    mkFireholRule
    redirectDomains
    ;
  inherit (builtins) map;
  cfg = cfgNixos config.${namespace} ./.;
  dhcpPort = [
    67
    68
  ];
  name = getDirname _name;
  dnsPort = 53;
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

        # enable IPv6 Route Advertisements
        enable-ra = true;

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
          "${mac.yanyu},${ip.yanyu},yanyu"
        ];
        interface = cfg.lan;

        # local domains
        local = "/lan/";
        domain = "lan";
        expand-hosts = true;

        no-hosts = false;
        cname = map (v: "${v.from},${v.to}") redirectDomains;
      };
    };
    networking.firewall = {
      allowedTCPPorts = lib.optional cfg.dns.enable dnsPort;
      allowedUDPPorts = dhcpPort;
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = lib.optional cfg.dns.enable dnsPort;
      udp = dhcpPort ++ lib.optional cfg.dns.enable dnsPort;
    };
  };
  extraOpts = {
    lan = mkOpt' lib.types.str "";
    dns = switch;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
