{ lib, namespace, ... }:
let
  inherit (builtins)
    concatStringsSep
    map
    attrValues
    foldl'
    ;
  mkOutboundSub =
    tag: type:
    {
      inherit type;
      providers = [ tag ];
      include = ".*";
      exclude = lib.${namespace}.subsExcludes;
      tag = "provider/${tag}";
    }
    // lib.optionalAttrs (type == "urltest") { tolerance = 100; };
  subs = [
    (mkOutboundSub "knjc" "urltest")
    (mkOutboundSub "nano" "urltest")
  ];
  getTag = map (x: x.tag);
  outbounds =
    let
      mkOutbound = tag: include: {
        type = "urltest";
        use_all_providers = true;
        inherit tag include;
      };
      toSelector =
        origin:
        (lib.attrsets.filterAttrs (n: _v: n != "tolerance") origin)
        // {
          type = "selector";
          tag = origin.tag + " 手动";
        };
      HK = mkOutbound "🇭🇰 香港节点" "港|HK|Hong Kong";
      HKSelector = toSelector HK;
      TW = mkOutbound "🇹🇼 台湾节点" "台|新北|彰化|TW|Taiwan";
      TWSelector = toSelector TW;
      JP = mkOutbound "🇯🇵 日本节点" "日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan";
      JPSelector = toSelector JP;
      KR = mkOutbound "🇰🇷 韩国节点" "KR|Korea|KOR|首尔|韩|韓";
      KRSelector = toSelector KR;
      SG = mkOutbound "🇸🇬 新加坡节点" "新加坡|坡|狮城|SG|Singapore";
      SGSelector = toSelector SG;
      US = mkOutbound "🇺🇸 美国节点" "美|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|US|United States";
      USSelector = toSelector US;
      VN = mkOutbound "🇻🇳 越南节点" "越南|VN|Vlet Nam";
      VNSelector = toSelector VN;
      FR = mkOutbound "🇫🇷 法国节点" "法国|FR|FRA|France";
      FRSelector = toSelector FR;
      ES = mkOutbound "🇪🇸 西班牙节点" "西班牙|ES|Spain";
      ESSelector = toSelector ES;
      DE = mkOutbound "🇩🇪 德国节点" "德国|DE|Germany";
      DESelector = toSelector DE;
      IN = mkOutbound "🇮🇳 印度节点" "印度|IN|India";
      INSelector = toSelector IN;
      BR = mkOutbound "🇧🇷 巴西节点" "巴西|BR|Brazil";
      BRSelector = toSelector BR;
      countries = [
        HK
        TW
        JP
        KR
        SG
        US
        VN
        FR
        ES
        DE
        IN
        BR
        HKSelector
        TWSelector
        JPSelector
        KRSelector
        SGSelector
        USSelector
        VNSelector
        FRSelector
        ESSelector
        DESelector
        INSelector
        BRSelector
      ];
      countriesTags = getTag countries;
      subsTags = getTag subs;
      cheap = mkOutbound "📺 省流节点" "0.[1-5]|低倍率|省流|大流量";
      expensive = mkOutbound "👍 高级节点" "专线|专用|高级|直连|急速|高倍率|游戏|game|Game|GAME|IEPL|IPLC|AIA|CTM|CC|iepl|iplc|aia|ctm|cc|AC";
      priceTags = getTag [
        cheap
        expensive
      ];
    in
    rec {
      inherit cheap expensive countries;
      main = {
        type = "selector";
        tag = "🚀 节点选择";
        outbounds =
          subsTags
          ++ countriesTags
          ++ priceTags
          ++ [
            manual.tag
            direct.tag
          ];
      };
      final = {
        type = "selector";
        tag = "🐟 漏网之鱼";
        outbounds = [ direct.tag ] ++ subsTags ++ countriesTags ++ priceTags ++ [ manual.tag ];
      };
      not_cn = {
        type = "selector";
        tag = "🌐 非中国";
        outbounds = [ direct.tag ] ++ subsTags ++ countriesTags ++ priceTags ++ [ manual.tag ];
      };
      foreign = {
        type = "selector";
        tag = "🎯 全球直连";
        outbounds = getTag [
          direct
          main
        ];
      };
      telegram = {
        type = "selector";
        tag = "📲 电报消息";
        outbounds = [ main.tag ] ++ countriesTags;
      };
      ai = {
        type = "selector";
        tag = "🤖 人工智能";
        outbounds = countriesTags ++ [ main.tag ];
      };
      games = {
        type = "selector";
        tag = "🎮 游戏平台";
        outbounds = getTag [
          direct
          main
        ];
      };
      microsoft = {
        type = "selector";
        tag = "🪟 微软服务";
        outbounds = getTag [
          direct
          main
        ];
      };
      google = {
        type = "selector";
        tag = "🇬 谷歌服务";
        outbounds = getTag [
          direct
          main
        ];
      };
      apple = {
        type = "selector";
        tag = "🍎 苹果服务";
        outbounds = getTag [
          direct
          main
        ];
      };
      networktest = {
        type = "selector";
        tag = "📈 网络测试";
        outbounds = [ direct.tag ] ++ countriesTags ++ subsTags ++ [ manual.tag ];
      };
      netflix = {
        type = "selector";
        tag = "🎥 奈飞解锁";
        outbounds = getTag [
          expensive
          main
        ];
      };
      youtube = {
        type = "selector";
        tag = "📺 Youtube";
        outbounds = [ main.tag ] ++ subsTags ++ countriesTags;
      };
      github = {
        type = "selector";
        tag = "🐱 Github";
        outbounds = [ main.tag ] ++ subsTags ++ countriesTags;
      };
      global = {
        type = "selector";
        tag = "GLOBAL";
        outbounds = [ direct.tag ] ++ countriesTags ++ subsTags ++ [ manual.tag ];
      };
      cn = {
        type = "selector";
        tag = "🔒 国内服务";
        outbounds = [ direct.tag ] ++ countriesTags ++ subsTags ++ [ manual.tag ];
      };
      direct = {
        type = "direct";
        tag = "DIRECT";
      };
      manual = {
        type = "selector";
        tag = "🚀 手动切换";
        use_all_providers = true;
      };
    };
  outboundsSorted = [
    outbounds.main
    outbounds.final
    outbounds.not_cn
  ]
  ++ subs
  ++ [ outbounds.manual ]
  ++ outbounds.countries
  ++ [
    outbounds.cheap
    outbounds.expensive
    outbounds.foreign
    outbounds.telegram
    outbounds.youtube
    outbounds.github
    outbounds.ai
    outbounds.games
    outbounds.microsoft
    outbounds.google
    outbounds.apple
    outbounds.networktest
    outbounds.netflix
    outbounds.global
    outbounds.cn
    outbounds.direct
  ];
  dnsServers = {
    direct = {
      tag = "dns_direct";
      type = "udp";
      server = "223.5.5.5";
    };
    proxy = {
      tag = "dns_proxy";
      type = "tls";
      server = "8.8.4.4";
    };
    resolver = {
      tag = "dns_resolver";
      type = "udp";
      server = "223.5.5.5";
    };
    fakeip = {
      tag = "dns_fakeip";
      type = "fakeip";
      inet4_range = "fc00::/16";
      inet6_range = "198.18.0.0/16";
    };
    hosts = {
      tag = "hosts";
      type = "hosts";
      predefined = foldl' (acc: v: acc // { "${v}" = lib.${namespace}.ip.brix; }) { } (
        attrValues lib.${namespace}.domains
      );
    };
    local = {
      tag = "local";
      type = "local";
    };
  };
  ruleSet =
    let
      geo = tag: {
        inherit tag;
        type = "remote";
        format = "binary";
        url = "https://fastly.jsdelivr.net/gh/MetaCubeX/meta-rules-dat@sing/geo/geosite/${tag}.srs";
        download_detour = outbounds.direct.tag;
      };
      ip = tag: {
        tag = "${tag}_ip";
        type = "remote";
        format = "binary";
        url = "https://fastly.jsdelivr.net/gh/MetaCubeX/meta-rules-dat@sing/geo/geoip/${tag}.srs";
        download_detour = outbounds.direct.tag;
      };
    in
    {
      ai = geo "category-ai-!cn";
      youtube = geo "youtube";
      google = geo "google";
      geo_cn = geo "geolocation-cn";
      cn = geo "cn";
      github = geo "github";
      gitlab = geo "gitlab";
      geo_not_cn = geo "geolocation-!cn";
      google_ip = ip "google";
      private_ip = ip "private";
      cn_ip = ip "cn";
      telegram_ip = ip "telegram";
    };
in
{
  sing-box = {
    inherit
      outboundsSorted
      dnsServers
      ruleSet
      outbounds
      ;
    dnsRules = [
      {
        rule_set = ruleSet.geo_not_cn.tag;
        query_type = [
          "A"
          "AAAA"
        ];
        server = dnsServers.fakeip.tag;
      }
      {
        rule_set = ruleSet.geo_not_cn.tag;
        query_type = [ "CNAME" ];
        server = dnsServers.proxy.tag;
      }
      {
        query_type = [
          "A"
          "AAAA"
          "CNAME"
        ];
        invert = true;
        server = dnsServers.local.tag;
      }
      {
        domain_suffix = "zxc.cn";
        server = dnsServers.hosts.tag;
      }
    ];
    routeRules = [
      { action = "sniff"; }
      {
        protocol = "dns";
        action = "hijack-dns";
      }
      {
        protocol = "bittorrent";
        outbound = outbounds.direct.tag;
      }
      {
        clash_mode = "global";
        outbound = outbounds.global.tag;
      }
      {
        clash_mode = "direct";
        outbound = outbounds.direct.tag;
      }
      {
        rule_set = ruleSet.ai.tag;
        outbound = outbounds.ai.tag;
      }
      {
        rule_set = ruleSet.youtube.tag;
        outbound = outbounds.youtube.tag;
      }
      {
        rule_set = ruleSet.google.tag;
        outbound = outbounds.google.tag;
      }
      {
        rule_set = [
          ruleSet.geo_cn.tag
          ruleSet.cn.tag
        ];
        outbound = outbounds.cn.tag;
      }
      {
        rule_set = [
          ruleSet.github.tag
          ruleSet.gitlab.tag
        ];
        outbound = outbounds.github.tag;
      }
      {
        rule_set = ruleSet.geo_not_cn.tag;
        outbound = outbounds.github.tag;
      }
      {
        rule_set = ruleSet.google_ip.tag;
        outbound = outbounds.google.tag;
      }
      {
        rule_set = ruleSet.private_ip.tag;
        outbound = outbounds.direct.tag;
      }
      {
        rule_set = ruleSet.cn_ip.tag;
        outbound = outbounds.cn.tag;
      }
      {
        rule_set = ruleSet.telegram_ip.tag;
        outbound = outbounds.telegram.tag;
      }
    ];
    mkProvider =
      {
        tag,
        url,
        hour,
        minute ? 0,
      }:
      {
        type = "remote";
        user_agent = "clash.meta";
        update_interval = "${toString hour}h${toString minute}m0s";
        health_check = {
          enabled = true;
          url = "https://www.gstatic.com/generate_204";
          interval = "10m0s";
        };
        download_detour = outbounds.direct.tag;
        inherit url tag;
      };
    mkFirewall =
      let
        defaultProxyPorts =
          let
            emailPorts = [
              143
              465
              587
              853
              993
              995
            ];
            IRCPorts = [ 194 ];
            SSHPorts = [ 22 ];
            HTTPPorts = [
              80
              443
            ];
            XMPPPorts = [ 5222 ];
            SubHTTPPorts = [
              8080
              8443
            ];
            proxySSH = true;
            proxyHTTP = true;
            proxyXMPP = false;
            proxyIRC = false;
            proxyEmail = false;
            proxySubHTTP = false;
          in
          (if proxyEmail then emailPorts else [ ])
          ++ (if proxySSH then SSHPorts else [ ])
          ++ (if proxyHTTP then HTTPPorts else [ ])
          ++ (if proxyXMPP then XMPPPorts else [ ])
          ++ (if proxySubHTTP then SubHTTPPorts else [ ])
          ++ (if proxyIRC then IRCPorts else [ ]);
      in
      {
        name ? "sing-box",
        isTproxy ? true,
        FirewallMark ? toString 1,
        ipTableMark ? "100",
        ipTableMarkV6 ? "101",
        routingMark ? 255,
        apiPort ? 9999,
        tproxyPort ? 7893,
        redirectPort ? 7892,
        dnsPort ? 1053,
        mixPort ? 7890,
        fakeIpSubnet ? "198.18.0.0/16",
        fakeIp6Subnet ? "fc00::/16",
        proxyPorts ? defaultProxyPorts,
        reservedSubnets ? [
          "0.0.0.0/8"
          "10.0.0.0/8"
          "127.0.0.0/8"
          "100.64.0.0/10"
          "169.254.0.0/16"
          "172.16.0.0/12"
          "192.168.0.0/16"
          "224.0.0.0/4"
          "240.0.0.0/4"
        ],
        reservedSubnetsV6 ? [
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
        ],
      }:
      let
        validFakeIp = fakeIpSubnet != "";
        validFakeIp6 = fakeIp6Subnet != "";
        joinLines = concatStringsSep "\n";
        proxyPorts' = concatStringsSep "," (map toString proxyPorts);
        tailscaleIp = lib.pipe lib.${namespace}.tailscale [
          (builtins.attrValues)
          (map (x: "\n${x}/32"))
          (builtins.concatStringsSep "")
        ];
        waitWan = ''
          i=1
          while [ "$i" -le "20" ]; do
              host_ipv4=$(ip -o -f inet addr show | grep -Ev 'utun|iot|peer|docker|podman|virbr|vnet|ovs|vmbr|veth|vmnic|vboxnet|lxcbr|xenbr|vEthernet' | grep -E ' 1(92|0|72)\.' | awk '/scope global/ {print $4}')
              host_ipv4+=$'${tailscaleIp}'
              host_ipv6=$(ip -o -f inet6 addr show | awk '/scope global/ {print $4}')
              [ -n "$host_ipv6" ] && [ -n "$host_ipv4" ] && break
              sleep 1 && i=$((i + 1))
          done
        '';
        routeStart =
          if isTproxy then
            ''
              ip rule add fwmark ${FirewallMark} lookup ${ipTableMark}
              ip route add local default dev lo table ${ipTableMark}
              ip -6 rule add fwmark ${FirewallMark} lookup ${ipTableMarkV6}
              ip -6 route add local default dev lo table ${ipTableMarkV6}
            ''
          else
            "";
        routeStop =
          if isTproxy then
            ''
              ip rule del fwmark ${FirewallMark} table ${ipTableMark} 2>/dev/null
              ip route flush table ${ipTableMark} 2>/dev/null
              ip -6 rule del fwmark ${FirewallMark} table ${ipTableMarkV6} 2>/dev/null
              ip -6 route flush table ${ipTableMarkV6} 2>/dev/null
            ''
          else
            "";
        natTable = "${name}_nat";
        natTableDns = "${name}_nat_dns";
        natStart = joinLines (
          if isTproxy then
            (map (x: "iptables -w -t nat ${x}") [
              "-N ${natTable}"
              "-A PREROUTING -p udp -m udp --dport 53 -j ${natTable}"
              "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTable}"
              "-A ${natTable} -m mark --mark ${toString routingMark} -j RETURN"
            ])
            ++ [
              "for ipv4 in $host_ipv4; do"
              "iptables -w -t nat -A ${natTable} -s $ipv4 -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
              "iptables -w -t nat -A ${natTable} -s $ipv4 -p udp -j REDIRECT --to-ports ${toString dnsPort}"
              "done"
            ]
          else
            map (x: "ip6tables -w -t nat ${x}") (
              [
                "-N ${natTable}"
                "-N ${natTableDns}"
                "-A PREROUTING -p udp -m udp --dport 53 -j ${natTableDns}"
                "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTableDns}"
              ]
              ++ lib.optional validFakeIp "-A PREROUTING -d ${fakeIpSubnet} -p tcp -j ${natTable}"
              ++ [
                "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTable}"
                "-A ${natTable} -p tcp -m tcp --dport 53 -j RETURN"
                "-A ${natTable} -p udp -m udp --dport 53 -j RETURN"
                "-A ${natTable} -m mark --mark ${FirewallMark} -j RETURN"
              ]
            )
            ++ [
              "for ipv4 in $host_ipv4; do"
              "ip6tables -w -t nat -A ${natTable} -d $ipv4 -j RETURN"
              "ip6tables -w -t nat -A ${natTable} -s $ipv4 -p tcp -j REDIRECT --to-ports ${toString redirectPort}"
              "ip6tables -w -t nat -A ${natTable} -s $ipv4 -p udp -j REDIRECT --to-ports ${toString redirectPort}"
              "done"
            ]
            ++ map (x: "ip6tables -w -t nat ${x}") (
              (map (x: "-A ${natTable} -d ${x} -j RETURN") reservedSubnets)
              ++ [ "-A ${natTableDns} -m mark --mark ${FirewallMark} -j RETURN" ]
            )
            ++ [
              "for ipv4 in $host_ipv4; do"
              "ip6tables -w -t nat -A ${natTableDns} -s $ipv4 -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
              "ip6tables -w -t nat -A ${natTableDns} -s $ipv4 -p udp -j REDIRECT --to-ports ${toString dnsPort}"
              "done"
            ]

        );
        natStop = joinLines (
          if isTproxy then
            map (x: "iptables -w -t nat ${x}") [
              "-D PREROUTING -p udp -m udp --dport 53 -j ${natTable}"
              "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTable}"
              "-F ${natTable}"
              "-X ${natTable}"
            ]
          else
            map (x: "iptables -w -t nat ${x}") [
              "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableDns}"
              "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableDns}"
            ]
            ++ lib.optional validFakeIp "-D PREROUTING -d ${fakeIpSubnet} -p tcp -j ${natTable}"
            ++ [
              "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTable}"
              "-F ${natTable}"
              "-X ${natTable}"
              "-F ${natTableDns}"
              "-X ${natTableDns}"
            ]
        );
        natTableV6 = "${name}_v6_nat";
        natTableV6Dns = "${name}_v6_nat_dns";
        natStartV6 =
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
              map (x: "ip6tables -w -t nat ${x}") (
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
              for ip in $host_ipv6; do
              ip6tables -w -t nat -A ${natTableV6} -s "$ip" -p tcp -j REDIRECT --to-ports ${toString dnsPort}
              ip6tables -w -t nat -A ${natTableV6} -s "$ip" -p udp -j REDIRECT --to-ports ${toString dnsPort}
              done
            ''
            + "\n"
            + joinLines (
              map (x: "ip6tables -w -t nat ${x}") [
                "-A ${natTableV6} -p tcp -j RETURN"
                "-A ${natTableV6} -p udp -j RETURN"
              ]
            )
          else
            joinLines (
              map (x: "ip6tables -w -t nat ${x}") (
                [
                  "-N ${natTableV6}"
                  "-N ${natTableV6Dns}"
                  "-A PREROUTING -p udp -m udp --dport 53 -j ${natTableV6Dns}"
                  "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6Dns}"
                ]
                ++ lib.optional validFakeIp6 "-A PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${natTableV6}"
                ++ [
                  "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTableV6}"
                  "-A ${natTableV6} -p tcp -m tcp --dport 53 -j RETURN"
                  "-A ${natTableV6} -p udp -m udp --dport 53 -j RETURN"
                  "-A ${natTableV6} -m mark --mark ${FirewallMark} -j RETURN"
                ]
                ++ map (x: "-A ${natTableV6} -d ${x} -j RETURN") reservedSubnetsV6
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
              for ip in $host_ipv6; do
              ip6tables -w -t nat -A ${natTableV6Dns} -s "$ip" -p tcp -j REDIRECT --to-ports ${toString dnsPort}
              ip6tables -w -t nat -A ${natTableV6Dns} -s "$ip" -p udp -j REDIRECT --to-ports ${toString dnsPort}
              done
            ''
            + "\n"
            + map (x: "ip6tables -w -t nat ${x}") [
              "-A ${natTableV6Dns} -p tcp -j RETURN"
              "-A ${natTableV6Dns} -p udp -j RETURN"
            ];
        natStopV6 = joinLines (
          if isTproxy then
            (map (x: "ip6tables -w -t nat ${x}") [
              "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableV6}"
              "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6}"
              "-F ${natTableV6}"
              "-X ${natTableV6}"
            ])
          else
            map (x: "ip6tables -w -t nat ${x}") (
              [
                "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableV6Dns}"
                "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6Dns}"
              ]
              ++ lib.optional validFakeIp6 "-D PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${natTableV6}"
              ++ [
                "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${natTableV6}"
                "-F ${natTableV6}"
                "-F ${natTableV6Dns}"
                "-X ${natTableV6}"
                "-X ${natTableV6Dns}"
              ]
            )
        );
        mangleTable = "${name}_mangle";
        mangleStart =
          if isTproxy then
            (joinLines (
              (map (x: "iptables -w -t mangle ${x}") (
                [ "-N ${mangleTable}" ]
                ++ lib.optionals validFakeIp [
                  "-A PREROUTING -d ${fakeIpSubnet} -p tcp -j ${mangleTable}"
                  "-A PREROUTING -d ${fakeIpSubnet} -p udp -j ${mangleTable}"
                ]
                ++ [
                  "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
                  "-A PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
                  "-A ${mangleTable} -p tcp -m tcp --dport 53 -j RETURN"
                  "-A ${mangleTable} -p udp -m udp --dport 53 -j RETURN"
                  "-A ${mangleTable} -m mark --mark ${toString routingMark} -j RETURN"
                ]
              ))
              ++ [
                "for ipv4 in $host_ipv4; do"
                "iptables -w -t mangle -A ${mangleTable} -d $ipv4 -j RETURN"
                "done"
              ]
              ++ (map (x: "iptables -w -t mangle ${x}") (
                map (x: "-A ${mangleTable} -d ${x} -j RETURN") reservedSubnets
              ))
              ++ [
                "for ipv4 in $host_ipv4; do"
                "iptables -w -t mangle -A ${mangleTable} -s $ipv4 -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip 0.0.0.0 --tproxy-mark ${FirewallMark}"
                "done"
              ]
            ))
          else
            "";
        mangleStop =
          if isTproxy then
            (joinLines (
              map (x: "iptables -w -t mangle ${x}") (
                lib.optionals validFakeIp [
                  "-D PREROUTING -d ${fakeIpSubnet} -p tcp -j ${mangleTable}"
                  "-D PREROUTING -d ${fakeIpSubnet} -p udp -j ${mangleTable}"
                ]
                ++ [
                  "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
                  "-D PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTable}"
                  "-F ${mangleTable}"
                  "-X ${mangleTable}"
                ]
              )
            ))
          else
            "";
        mangleTableV6 = "${name}_mangle_v6";
        mangleStartV6 =
          if isTproxy then
            (
              joinLines (
                map (x: "ip6tables -w -t mangle ${x}") (
                  [ "-N ${mangleTableV6}" ]
                  ++ lib.optionals validFakeIp6 [
                    "-A PREROUTING -d ${fakeIp6Subnet} -p udp -j ${mangleTableV6}"
                    "-A PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${mangleTableV6}"
                  ]
                  ++ [
                    "-A PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
                    "-A PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
                    "-A ${mangleTableV6} -p tcp -m tcp --dport 53 -j RETURN"
                    "-A ${mangleTableV6} -p udp -m udp --dport 53 -j RETURN"
                    "-A ${mangleTableV6} -m mark --mark ${FirewallMark} -j RETURN"
                  ]
                  ++ map (x: "-A ${mangleTableV6} -d ${x} -j RETURN") reservedSubnetsV6
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
                for ip in $host_ipv6; do
                    ip6tables -w -t mangle -A ${mangleTableV6} -s "$ip" -p udp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}
                    ip6tables -w -t mangle -A ${mangleTableV6} -s "$ip" -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}
                done
              ''
            )
          else
            "";
        mangleStopV6 =
          if isTproxy then
            (joinLines (
              map (x: "ip6tables -w -t mangle ${x}") (
                lib.optionals validFakeIp6 [
                  "-D PREROUTING -d ${fakeIp6Subnet} -p udp -j ${mangleTableV6}"
                  "-D PREROUTING -d ${fakeIp6Subnet} -p tcp -j ${mangleTableV6}"
                ]
                ++ [
                  "-D PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
                  "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
                  "-F ${mangleTableV6}"
                  "-X ${mangleTableV6}"
                ]
              )
            ))
          else
            "";
        filterStart = joinLines (
          map (x: "iptables -w -t filter ${x}") (
            map (x: "-A INPUT -s ${x} -p tcp -m tcp --dport ${toString apiPort} -j ACCEPT") reservedSubnets
            ++ map (x: "-A INPUT -s ${x} -p tcp -m tcp --dport ${toString mixPort} -j ACCEPT") reservedSubnets
            ++ [
              "-A INPUT -p tcp -m tcp --dport ${toString apiPort} -j REJECT --reject-with icmp-port-unreachable"
              "-A INPUT -p tcp -m tcp --dport ${toString mixPort} -j REJECT --reject-with icmp-port-unreachable"
            ]
          )
        );
        filterStop = joinLines (
          map (x: "iptables -w -t filter ${x}") (
            map (x: "-D INPUT -s ${x} -p tcp -m tcp --dport ${toString apiPort} -j ACCEPT") reservedSubnets
            ++ map (x: "-D INPUT -s ${x} -p tcp -m tcp --dport ${toString mixPort} -j ACCEPT") reservedSubnets
            ++ [
              "-D INPUT -p tcp -m tcp --dport ${toString apiPort} -j REJECT --reject-with icmp-port-unreachable"
              "-D INPUT -p tcp -m tcp --dport ${toString mixPort} -j REJECT --reject-with icmp-port-unreachable"
            ]
          )
        );
      in
      {
        start =
          waitWan
          + "\n"
          + routeStart
          + "\n"
          + natStart
          + "\n"
          + natStartV6
          + "\n"
          + mangleStart
          + "\n"
          + mangleStartV6
          + "\n"
          + filterStart;
        stop =
          routeStop
          + "\n"
          + natStop
          + "\n"
          + natStopV6
          + "\n"
          + mangleStop
          + "\n"
          + mangleStopV6
          + "\n"
          + filterStop;
      };
  };
}
