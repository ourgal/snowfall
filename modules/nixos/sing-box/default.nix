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
    subnet
    mkOpt'
    cfgNixos
    enabled
    ;
  inherit (lib.${namespace}.sing-box)
    dnsServers
    outboundsSorted
    outbounds
    routeRules
    dnsRules
    ruleSet
    ;
  cfg = cfgNixos config.${namespace} ./.;
  isTproxy = cfg.mode == "tproxy";
  apiPort = 9999;
  tproxyPort = 7893;
  redirectPort = 7892;
  dnsPort = 1053;
  mixPort = 7890;
  FirewallMark = toString 1;
  routingMark = 255;
  fakeIpSubnet = "198.18.0.0/16";
  fakeIp6Subnet = "fc00::/16";
  fakeIpExclude = [
    {
      domain = [
        "localhost"
        "time.android.com"
        "time.facebook.com"
      ];
      server = dnsServers.hosts_local.tag;
    }
  ];
  customRouteRules = [
    {
      domain_suffix = lib.strings.splitString "\n" (lib.strings.fileContents ./whitelist.key);
      outbound = outbounds.direct.tag;
    }
    {
      domain_suffix = lib.strings.splitString "\n" (lib.strings.fileContents ./blacklist.key);
      outbound = outbounds.main.tag;
    }
  ];
  proxyPorts = [
    22
    80
    143
    194
    443
    465
    587
    853
    993
    995
    5222
    8080
    8443
  ];
  proxyPorts' = builtins.concatStringsSep "," (builtins.map (x: toString x) proxyPorts);
  reserved_subnets = [
    "0.0.0.0/8"
    "10.0.0.0/8"
    "127.0.0.0/8"
    "100.64.0.0/10"
    "169.254.0.0/16"
    "172.16.0.0/12"
    "192.168.0.0/16"
    "224.0.0.0/4"
    "240.0.0.0/4"
  ];
  reserved_subnets_v6 = [
    "fe80::/10"
    "fd00::/8"
    "::/128"
    "::1/128"
    "::ffff:0.0.0.0/96"
    "64:ff9b::/96"
    "100::/64"
    "2001::/32"
    "2001:20::/28"
    "2001:db8::/32"
    "2002::/16"
    "fe80::/10"
    "ff00::/8"
  ];
  value = {
    services.sing-box = enabled // {
      package = pkgs.${namespace}.sing-box-fork;
      settings = {
        dns = {
          servers = builtins.attrValues dnsServers;
          rules = fakeIpExclude ++ dnsRules;
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
          rule_set = builtins.attrValues ruleSet;
          final = outbounds.final.tag;
          auto_detect_interface = false;
          default_mark = 255;
        };
        experimental = {
          cache_file = {
            path = "cache.db";
            store_fakeip = true;
            store_rdrc = true; # rejected dns record
          };
          clash_api = {
            external_controller = "0.0.0.0:${toString apiPort}";
            external_ui = "${pkgs.metacubexd}";
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
        outbound_providers =
          let
            default = {
              type = "remote";
              download_ua = "clash.meta";
              download_interval = "24h0m0s";
              healthcheck_url = "https://www.gstatic.com/generate_204";
              healthcheck_interval = "10m0s";
              download_detour = outbounds.direct.tag;
            };
          in
          [
            (
              rec {
                tag = "nano";
                path = "./providers/${tag}.yaml";
                download_url = lib.strings.fileContents ./nano.key;
              }
              // default
            )
            (
              rec {
                tag = "knjc";
                path = "./providers/${tag}.yaml";
                download_url = lib.strings.fileContents ./knjc.key;
              }
              // default
            )
          ];
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
        joinLines = builtins.concatStringsSep "\n";
        inherit (builtins) map;
        ipTableMark = "100";
        ipTableMarkV6 = "101";
        routeStart = pkgs.writeShellScript "routeStart" (
          if isTproxy then
            ''
              ${pkgs.iproute2}/bin/ip rule add fwmark ${FirewallMark} lookup ${ipTableMark}
              ${pkgs.iproute2}/bin/ip route add local default dev lo table ${ipTableMark}
              ${pkgs.iproute2}/bin/ip -6 rule add fwmark ${FirewallMark} lookup ${ipTableMarkV6}
              ${pkgs.iproute2}/bin/ip -6 route add local default dev lo table ${ipTableMarkV6}
            ''
          else
            ""
        );
        routeStop = pkgs.writeShellScript "routeStop" (
          if isTproxy then
            ''
              ${pkgs.iproute2}/bin/ip rule del fwmark ${FirewallMark} table ${ipTableMark} 2>/dev/null
              ${pkgs.iproute2}/bin/ip route flush table ${ipTableMark} 2>/dev/null
              ${pkgs.iproute2}/bin/ip -6 rule del fwmark ${FirewallMark} table ${ipTableMarkV6} 2>/dev/null
              ${pkgs.iproute2}/bin/ip -6 route flush table ${ipTableMarkV6} 2>/dev/null
            ''
          else
            ""
        );
        natTableDns = "sing-box_nat_dns";
        natTable = "sing-box_nat";
        natStart = pkgs.writeShellScript "natStart" (
          joinLines (
            if isTproxy then
              map (x: "${pkgs.iptables}/bin/iptables -w -t nat ${x}") [
                "-N ${natTable}"
                "-A PREROUTING -p udp -m udp --dport 53 -j ${natTable}"
                "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTable}"
                "-A ${natTable} -m mark --mark ${toString routingMark} -j RETURN"
                "-A ${natTable} -s ${subnet} -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
                "-A ${natTable} -s ${subnet} -p udp -j REDIRECT --to-ports ${toString dnsPort}"
              ]
            else
              map (x: "${pkgs.iptables}/bin/ip6tables -w -t nat ${x}") (
                [
                  "-N ${natTable}"
                  "-N ${natTableDns}"
                  "-A PREROUTING -p udp -m udp --dport 53 -j ${natTableDns}"
                  "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTableDns}"
                  "-A PREROUTING -d ${fakeIpSubnet} -p tcp -j ${natTable}"
                  "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTable}"
                  "-A ${natTable} -p tcp -m tcp --dport 53 -j RETURN"
                  "-A ${natTable} -p udp -m udp --dport 53 -j RETURN"
                  "-A ${natTable} -m mark --mark ${FirewallMark} -j RETURN"
                  "-A ${natTable} -d ${subnet} -j RETURN"
                  "-A ${natTable} -s ${subnet} -p tcp -j REDIRECT --to-ports ${toString redirectPort}"
                  "-A ${natTable} -s ${subnet} -p udp -j REDIRECT --to-ports ${toString redirectPort}"
                ]
                ++ map (x: "-A ${natTable} -d ${x} -j RETURN") reserved_subnets
                ++ [
                  "-A ${natTableDns} -m mark --mark ${FirewallMark} -j RETURN"
                  "-A ${natTableDns} -s ${subnet} -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
                  "-A ${natTableDns} -s ${subnet} -p udp -j REDIRECT --to-ports ${toString dnsPort}"
                ]
              )
          )
        );
        natStop = pkgs.writeShellScript "natStop" (
          joinLines (
            if isTproxy then
              map (x: "${pkgs.iptables}/bin/iptables -w -t nat ${x}") [
                "-D PREROUTING -p udp -m udp --dport 53 -j ${natTable}"
                "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTable}"
                "-F ${natTable}"
                "-X ${natTable}"
              ]
            else
              map (x: "${pkgs.iptables}/bin/iptables -w -t nat ${x}") [
                "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableDns}"
                "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableDns}"
                "-D PREROUTING -d ${fakeIpSubnet} -p tcp -j ${natTable}"
                "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTable}"
                "-F ${natTable}"
                "-X ${natTable}"
                "-F ${natTableDns}"
                "-X ${natTableDns}"
              ]
          )
        );
        natTableV6 = "sing-box_v6_nat";
        natTableV6Dns = "sing-box_v6_nat_dns";
        natStartV6 = pkgs.writeShellScript "natStartV6" (
          if isTproxy then
            let
              subnets = [
                "fe80::/10"
                "fe80::/10"
                "fd00::/8"
                "fd00::/8"
              ];
            in
            joinLines (
              map (x: "${pkgs.iptables}/bin/ip6tables -w -t nat ${x}") (
                [
                  "-N ${natTableV6}"
                  "-A PREROUTING -p udp -m udp --dport 53 -j ${natTableV6}"
                  "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6}"
                  "-A ${natTableV6} -m mark --mark ${FirewallMark} -j RETURN"
                ]
                ++ map (x: "-A ${natTableV6} -s ${x} -p tcp -j REDIRECT --to-ports ${toString dnsPort}") subnets
              )
            )
            + "\n"
            + ''
              host_ipv6=$(${pkgs.iproute2}/bin/ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
              for ip in $host_ipv6; do
                  ${pkgs.iptables}/bin/ip6tables -w -t nat -A ${natTableV6} -s "$ip" -p tcp -j REDIRECT --to-ports ${toString dnsPort}
                  ${pkgs.iptables}/bin/ip6tables -w -t nat -A ${natTableV6} -s "$ip" -p udp -j REDIRECT --to-ports ${toString dnsPort}
              done
            ''
            + "\n"
            + joinLines (
              map (x: "${pkgs.iptables}/bin/ip6tables -w -t nat ${x}") [
                "-A ${natTableV6} -p tcp -j RETURN"
                "-A ${natTableV6} -p udp -j RETURN"
              ]
            )
          else
            joinLines (
              map (x: "${pkgs.iptables}/bin/ip6tables -w -t nat ${x}") (
                [
                  "-N ${natTableV6}"
                  "-N ${natTableV6Dns}"
                  "-A PREROUTING -p udp -m udp --dport 53 -j ${natTableV6Dns}"
                  "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6Dns}"
                  "-A PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${natTableV6}"
                  "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTableV6}"
                  "-A ${natTableV6} -p tcp -m tcp --dport 53 -j RETURN"
                  "-A ${natTableV6} -p udp -m udp --dport 53 -j RETURN"
                  "-A ${natTableV6} -m mark --mark ${FirewallMark} -j RETURN"
                ]
                ++ map (x: "-A ${natTableV6} -d ${x} -j RETURN") reserved_subnets_v6
                ++ [
                  "-A ${natTableV6} -s fe80::/10 -p tcp -j REDIRECT --to-ports ${toString redirectPort}"
                  "-A ${natTableV6} -s fd00::/8 -p tcp -j REDIRECT --to-ports ${toString redirectPort}"
                  "-A ${natTableV6Dns} -m mark --mark ${FirewallMark} -j RETURN"
                  "-A ${natTableV6Dns} -s fe80::/10 -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
                  "-A ${natTableV6Dns} -s fe80::/10 -p udp -j REDIRECT --to-ports ${toString dnsPort}"
                  "-A ${natTableV6Dns} -s fd00::/8 -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
                  "-A ${natTableV6Dns} -s fd00::/8 -p udp -j REDIRECT --to-ports ${toString dnsPort}"
                ]
              )
            )
            + "\n"
            + ''
              host_ipv6=$(${pkgs.iproute2}/bin/ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
              for ip in $host_ipv6; do
                  ${pkgs.iptables}/bin/ip6tables -w -t nat -A ${natTableV6Dns} -s "$ip" -p tcp -j REDIRECT --to-ports ${toString dnsPort}
                  ${pkgs.iptables}/bin/ip6tables -w -t nat -A ${natTableV6Dns} -s "$ip" -p udp -j REDIRECT --to-ports ${toString dnsPort}
              done
            ''
            + "\n"
            + map (x: "${pkgs.iptables}/bin/ip6tables -w -t nat ${x}") [
              "-A ${natTableV6Dns} -p tcp -j RETURN"
              "-A ${natTableV6Dns} -p udp -j RETURN"
            ]
        );
        natStopV6 = pkgs.writeShellScript "natStopV6" (
          joinLines (
            if isTproxy then
              (map (x: "${pkgs.iptables}/bin/ip6tables -w -t nat ${x}") ([
                "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableV6}"
                "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6}"
                "-F ${natTableV6}"
                "-X ${natTableV6}"
              ]))
            else
              map (x: "${pkgs.iptables}/bin/ip6tables -w -t nat ${x}") ([
                "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableV6Dns}"
                "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6Dns}"
                "-D PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${natTableV6}"
                "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTableV6}"
                "-F ${natTableV6}"
                "-F ${natTableV6Dns}"
                "-X ${natTableV6}"
                "-X ${natTableV6Dns}"
              ])
          )
        );
        mangleTable = "sing-box_mangle";
        mangleStart = pkgs.writeShellScript "mangleStart" (
          joinLines (
            map (x: "${pkgs.iptables}/bin/iptables -w -t mangle ${x}") (
              [
                "-N ${mangleTable}"
                "-A PREROUTING -d ${fakeIpSubnet} -p tcp -j ${mangleTable}"
                "-A PREROUTING -d ${fakeIpSubnet} -p udp -j ${mangleTable}"
                "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
                "-A PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
                "-A ${mangleTable} -p tcp -m tcp --dport 53 -j RETURN"
                "-A ${mangleTable} -p udp -m udp --dport 53 -j RETURN"
                "-A ${mangleTable} -m mark --mark ${toString routingMark} -j RETURN"
                "-A ${mangleTable} -d ${subnet} -j RETURN"
              ]
              ++ (map (x: "-A ${mangleTable} -d ${x} -j RETURN") reserved_subnets)
              ++ [
                "-A ${mangleTable} -s ${subnet} -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip 0.0.0.0 --tproxy-mark ${FirewallMark}"
                "-A ${mangleTable} -s ${subnet} -p udp -j TPROXY --on-port ${toString tproxyPort} --on-ip 0.0.0.0 --tproxy-mark ${FirewallMark}"
              ]
            )
          )
        );
        mangleStop = pkgs.writeShellScript "mangleStop" (
          joinLines (
            map (x: "${pkgs.iptables}/bin/iptables -w -t mangle ${x}") ([
              "-D PREROUTING -d ${fakeIpSubnet} -p tcp -j ${mangleTable}"
              "-D PREROUTING -d ${fakeIpSubnet} -p udp -j ${mangleTable}"
              "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
              "-D PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
              "-F ${mangleTable}"
              "-X ${mangleTable}"
            ])
          )
        );
        mangleTableV6 = "sing-box_mangle_v6";
        mangleStartV6 = pkgs.writeShellScript "mangleStartV6" (
          joinLines (
            map (x: "${pkgs.iptables}/bin/ip6tables -w -t mangle ${x}") (
              [
                "-N ${mangleTableV6}"
                "-A PREROUTING -d ${fakeIp6Subnet} -p udp -j ${mangleTableV6}"
                "-A PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${mangleTableV6}"
                "-A PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
                "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
                "-A ${mangleTableV6} -p tcp -m tcp --dport 53 -j RETURN"
                "-A ${mangleTableV6} -p udp -m udp --dport 53 -j RETURN"
                "-A ${mangleTableV6} -m mark --mark ${FirewallMark} -j RETURN"
              ]
              ++ map (x: "-A ${mangleTableV6} -d ${x} -j RETURN") reserved_subnets_v6
              ++ [
                "-A ${mangleTableV6} -s fe80::/10 -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}"
                "-A ${mangleTableV6} -s fd00::/8 -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}"
                "-A ${mangleTableV6} -s fe80::/10 -p udp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}"
                "-A ${mangleTableV6} -s fd00::/8 -p udp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}"
              ]
            )
          )
          + "\n"
          + ''
            host_ipv6=$(${pkgs.iproute2}/bin/ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
            for ip in $host_ipv6; do
                ${pkgs.iptables}/bin/ip6tables -w -t mangle -A ${mangleTableV6} -s "$ip" -p udp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}
                ${pkgs.iptables}/bin/ip6tables -w -t mangle -A ${mangleTableV6} -s "$ip" -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}
            done
          ''
        );
        mangleStopV6 = pkgs.writeShellScript "mangleStopV6" (
          joinLines (
            map (x: "${pkgs.iptables}/bin/ip6tables -w -t mangle ${x}") ([
              "-D PREROUTING -d ${fakeIp6Subnet} -p udp -j ${mangleTableV6}"
              "-D PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${mangleTableV6}"
              "-D PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
              "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
              "-F ${mangleTableV6}"
              "-X ${mangleTableV6}"
            ])
          )
        );
        filterStart = pkgs.writeShellScript "filterStart" (
          joinLines (
            map (x: "${pkgs.iptables}/bin/iptables -w -t filter ${x}") (
              map (x: "-A INPUT -s ${x} -p tcp -m tcp --dport ${toString apiPort} -j ACCEPT") reserved_subnets
              ++ map (x: "-A INPUT -s ${x} -p tcp -m tcp --dport ${toString mixPort} -j ACCEPT") reserved_subnets
              ++ [
                "-A INPUT -p tcp -m tcp --dport ${toString apiPort} -j REJECT --reject-with icmp-port-unreachable"
                "-A INPUT -p tcp -m tcp --dport ${toString mixPort} -j REJECT --reject-with icmp-port-unreachable"
              ]
            )
          )
        );
        filterStop = pkgs.writeShellScript "filterStop" (
          joinLines (
            map (x: "${pkgs.iptables}/bin/iptables -w -t filter ${x}") (
              map (x: "-D INPUT -s ${x} -p tcp -m tcp --dport ${toString apiPort} -j ACCEPT") reserved_subnets
              ++ map (x: "-D INPUT -s ${x} -p tcp -m tcp --dport ${toString mixPort} -j ACCEPT") reserved_subnets
              ++ [
                "-D INPUT -p tcp -m tcp --dport ${toString apiPort} -j REJECT --reject-with icmp-port-unreachable"
                "-D INPUT -p tcp -m tcp --dport ${toString mixPort} -j REJECT --reject-with icmp-port-unreachable"
              ]
            )
          )
        );
        waitWan = pkgs.writeShellScript "waitWan" ''
          i=1
          while [ "$i" -le "20" ]; do
              host_ipv6=$(${pkgs.iproute2}/bin/ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
              [ -n "$host_ipv6" ] && break
              sleep 1 && i=$((i + 1))
          done
        '';
      in
      {
        serviceConfig = {
          ExecStartPre =
            [
              waitWan
              routeStart
              natStart
              natStartV6
              filterStart
            ]
            ++ lib.optionals isTproxy [
              mangleStart
              mangleStartV6
            ];
          ExecStop =
            [
              routeStop
              natStop
              natStopV6
              filterStop
            ]
            ++ lib.optionals isTproxy [
              mangleStop
              mangleStopV6
            ];
        };
      };
  };
  extraOpts = {
    mode = mkOpt' (lib.types.enum [
      "tproxy"
      "redirect"
    ]) "tproxy";
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
