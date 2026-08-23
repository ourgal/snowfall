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
    ;
  inherit (builtins) attrValues;
  apiPort = 9999;
  mixPort = 7890;
  customdnsRules = [
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
      package = pkgs.sing-box;
      settings = {
        dns = {
          servers = attrValues dnsServers;
          rules = customdnsRules ++ dnsRules;
          final = dnsServers.local.tag;
          reverse_mapping = true;
        };
        ntp = {
          enabled = true;
          server = "time.apple.com";
          server_port = 123;
          interval = "30m";
        };
        inbounds = [
          {
            type = "mixed";
            tag = "mixed-in";
            listen = "0.0.0.0";
            listen_port = mixPort;
          }
          {
            type = "tun";
            tag = "tun-in";
            address = "172.19.0.1/30";
            auto_route = true;
            auto_redirect = true;
            strict_route = true;
            stack = "mixed";
          }
        ];
        outbounds = outboundsSorted;
        route = {
          default_domain_resolver = dnsServers.resolver.tag;
          rules = customRouteRules ++ routeRules;
          rule_set = attrValues ruleSet;
          final = outbounds.final.tag;
          auto_detect_interface = true;
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
        log = {
          disabled = false;
          level = "info";
          timestamp = true;
        };
        providers = [
          (mkProvider {
            tag = "nano";
            url = {
              _secret = config.sops.secrets."subs/nano".path;
            };
            hour = 4;
          })
          (mkProvider {
            tag = "knjc";
            url = {
              _secret = config.sops.secrets."subs/knjc".path;
            };
            hour = 24;
          })
        ];
      };
    };
    networking = {
      firewall =
        let
          p = [
            apiPort
            mixPort
            53
          ];
        in
        {
          allowedTCPPorts = p;
          allowedUDPPorts = p;
        };
    };
    ${namespace}.user.ports = [
      apiPort
      mixPort
    ];
  };
  _args = { inherit value args; };
in
nixosModule _args
