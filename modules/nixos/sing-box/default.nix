args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    ;
  inherit (lib.${namespace})
    nixosModule
    mkOpt'
    cfgNixos
    enabled
    domainBlackList
    domainWhiteList
    fakeIpExclude
    ;
  inherit (lib.${namespace}.sing-box)
    dnsServers
    outboundsSorted
    outbounds
    routeRules
    dnsRules
    ruleSet
    mkProvider
    mkFirewall
    ;
  inherit (builtins) map attrValues;
  freeSubs = lib.${namespace}.freeSubs { isMihomo = false; };
  cfg = cfgNixos config.${namespace} ./.;
  isTproxy = cfg.mode == "tproxy";
  apiPort = 9999;
  tproxyPort = 7893;
  redirectPort = 7892;
  dnsPort = 1053;
  mixPort = 7890;
  routingMark = 255;
  fakeIpSubnet = "198.18.0.0/16";
  fakeIp6Subnet = "fc00::/16";
  customdnsRules = [
    {
      domain = [
        "localhost"
        "time.android.com"
        "time.facebook.com"
      ];
      domain_suffix =
        (lib.strings.splitString "\n" (lib.strings.fileContents ./localDomain.key))
        ++ (map (v: v.from) lib.${namespace}.redirectDomains);
      server = dnsServers.hosts_local.tag;
    }
    {
      domain_suffix = fakeIpExclude;
      server = dnsServers.direct.tag;
    }
  ];
  customRouteRules = [
    {
      domain_suffix = domainWhiteList;
      outbound = outbounds.direct.tag;
    }
    {
      domain_suffix = domainBlackList;
      outbound = outbounds.main.tag;
    }
  ];
  value = {
    services.sing-box = enabled // {
      package = pkgs.${namespace}.sing-box-fork;
      settings = {
        dns = {
          servers = attrValues dnsServers;
          rules = customdnsRules ++ dnsRules;
          final = dnsServers.proxy.tag;
          independent_cache = true;
          reverse_mapping = true;
          fakeip = {
            enabled = true;
            inet4_range = fakeIpSubnet;
            inet6_range = fakeIp6Subnet;
          };
        };
        route = {
          rules = customRouteRules ++ routeRules;
          rule_set = attrValues ruleSet;
          final = outbounds.final.tag;
          auto_detect_interface = false;
          default_mark = routingMark;
        };
        experimental = {
          cache_file = {
            path = "cache.db";
            store_fakeip = true;
            store_rdrc = true; # rejected dns record
          };
          clash_api = {
            external_controller = "0.0.0.0:${toString apiPort}";
            external_ui = pkgs.metacubexd;
            external_ui_download_url = "https://github.com/MetaCubeX/Yacd-meta/archive/gh-pages.zip"; # if external_ui is empty
            secret = "";
            default_mode = "Rule";
          };
        };
        inbounds = [
          {
            type = "tproxy";
            tag = "tproxy-in";
            listen = "::";
            listen_port = tproxyPort;
            udp_fragment = true;
            sniff = true;
            sniff_override_destination = false;
          }
          {
            type = "redirect";
            tag = "redirect-in";
            listen = "::";
            listen_port = redirectPort;
            sniff = true;
            sniff_override_destination = false;
          }
          {
            type = "direct";
            tag = "dns-in";
            listen = "::";
            listen_port = dnsPort;
          }
          {
            type = "mixed";
            tag = "mixed-in";
            listen = "::";
            listen_port = mixPort;
            sniff = true;
            sniff_override_destination = false;
          }
        ];
        log = {
          disabled = false;
          level = "info";
          timestamp = true;
        };
        outbounds = outboundsSorted;
        outbound_providers = [
          (mkProvider "nano" { _secret = config.sops.secrets."subs/nano".path; } 4)
          (mkProvider "knjc" { _secret = config.sops.secrets."subs/knjc".path; } 24)
        ] ++ map (x: mkProvider x.name x.url x.updateInterval) (attrValues freeSubs);
      };
    };
    networking = {
      firewall =
        let
          p = [
            dnsPort
            apiPort
            mixPort
            53
          ] ++ (if isTproxy then [ tproxyPort ] else [ redirectPort ]);
        in
        {
          allowedTCPPorts = p;
          allowedUDPPorts = p;
        };
    };
    systemd.services.sing-box =
      let
        firewallScripts = mkFirewall {
          inherit
            isTproxy
            apiPort
            tproxyPort
            redirectPort
            dnsPort
            mixPort
            fakeIpSubnet
            fakeIp6Subnet
            routingMark
            ;
          FirewallMark = toString 1;
          ipTableMark = "100";
          ipTableMarkV6 = "101";
        };
        firewallStart = pkgs.writeShellScript "singboxFirewallStart" firewallScripts.start;
        firewallStop = pkgs.writeShellScript "singboxFirewallStop" firewallScripts.stop;
      in
      {
        path = with pkgs; [
          iptables
          iproute2
        ];
        serviceConfig = {
          ExecStartPre = [ firewallStart ];
          ExecStop = [ firewallStop ];
        };
      };
    ${namespace}.user.ports = [
      apiPort
      dnsPort
      mixPort
    ] ++ (if isTproxy then [ tproxyPort ] else [ redirectPort ]);
  };
  extraOpts = {
    mode = mkOpt' (lib.types.enum [
      "tproxy"
      "redirect"
    ]) "tproxy";
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
