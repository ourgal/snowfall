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
    mkBoolOpt'
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

        # Cache dns queries.
        cache-size = 1000;

        # enable IPv6 Route Advertisements
        enable-ra = true;

        interface = cfg.lan;

        # local domains
        local = "/lan/";
        domain = "lan";
        expand-hosts = true;

        no-hosts = false;
        cname = map (v: "${v.from},${v.to}") redirectDomains;
      }
      // (
        if cfg.dhcp.enable then
          {
            dhcp-range = [
              "${lan}.100,${lan}.249,24h"
              "::f,::ff,constructor:${cfg.lan},ra-stateless"
            ];
            dhcp-option =
              let
                gateway = if cfg.dhcp.gateway != "" then cfg.dhcp.gateway else "${lan}.1";
                dns = if cfg.dhcp.dns != "" then cfg.dhcp.dns else "${lan}.1";
              in
              [
                "3,${gateway}"
                "6,${dns}"
              ];
            dhcp-host = [
              "${mac.brix},${ip.brix},brix"
              "${mac.home},${ip.home},home"
              "${mac.onecloud},${ip.onecloud},onecloud"
              "${mac.nuc},${ip.nuc},nuc"
              "${mac.ct3003},${ip.ct3003},CT3003"
              "${mac.yanyu},${ip.yanyu},yanyu"
              "${mac.s10},${ip.s10},s10"
              "${mac.m6},${ip.m6},m6"
              "${mac.u20},${ip.u20},u20"
            ];

            dhcp-authoritative = cfg.dhcp.only;
          }
        else
          { dhcp-authoritative = false; }
      );
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
  extraOpts =
    let
      inherit (lib.types) str;
    in
    {
      lan = mkOpt' str "";
      dns = switch;
      dhcp = switch // {
        only = mkBoolOpt' false;
        gateway = mkOpt' str "";
        dns = mkOpt' str "";
      };
    };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
