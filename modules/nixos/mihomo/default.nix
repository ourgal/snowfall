args:
let
  inherit (args)
    namespace
    lib
    config
    pkgs
    ;
  inherit (lib.${namespace})
    nixosModule
    enabled
    mkOpt'
    cfgNixos
    subnet
    ip
    ;
  inherit (lib.${namespace}.mihomo) mkProxyProvider mkRuleProvider mkProxyGroup;
  cfg = cfgNixos config.${namespace} ./.;
  isTproxy = cfg.mode == "tproxy";
  apiPort = 9999;
  tproxyPort = 7893;
  redirectPort = 7892;
  dnsPort = 1053;
  mixPort = 7890;
  routingMark = 255;
  FirewallMark = toString 1;
  fakeIpSubnet = "198.18.0.0/16";
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
  reservedSubnets = [
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
  reservedSubnetsV6 = [
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
  settings = {
    mixed-port = mixPort;
    redir-port = redirectPort;
    tproxy-port = tproxyPort;
    authentication = [ "" ];
    allow-lan = true;
    mode = "Rule";
    log-level = "info";
    ipv6 = true;
    external-controller = ":${toString apiPort}";
    external-ui = "ui";
    secret = null;
    tun = {
      enable = false;
    };
    find-process-mode = "off";
    routing-mark = routingMark;
    dns = {
      enable = true;
      listen = ":${toString dnsPort}";
      use-hosts = true;
      ipv6 = true;
      default-nameserver = [
        "114.114.114.114"
        "223.5.5.5"
      ];
      enhanced-mode = "fake-ip";
      fake-ip-range = fakeIpSubnet;
      fake-ip-filter = lib.strings.splitString "\n" (lib.strings.fileContents ./fakeIpExclude.key) ++ [
        "*.lan"
        "*.localdomain"
        "*.example"
        "*.invalid"
        "*.localhost"
        "*.test"
        "*.local"
        "*.home.arpa"
        "time.*.com"
        "time.*.gov"
        "time.*.edu.cn"
        "time.*.apple.com"
        "time-ios.apple.com"
        "time1.*.com"
        "time2.*.com"
        "time3.*.com"
        "time4.*.com"
        "time5.*.com"
        "time6.*.com"
        "time7.*.com"
        "ntp.*.com"
        "ntp1.*.com"
        "ntp2.*.com"
        "ntp3.*.com"
        "ntp4.*.com"
        "ntp5.*.com"
        "ntp6.*.com"
        "ntp7.*.com"
        "*.time.edu.cn"
        "*.ntp.org.cn"
        "+.pool.ntp.org"
        "time1.cloud.tencent.com"
        "music.163.com"
        "*.music.163.com"
        "*.126.net"
        "musicapi.taihe.com"
        "music.taihe.com"
        "songsearch.kugou.com"
        "trackercdn.kugou.com"
        "*.kuwo.cn"
        "api-jooxtt.sanook.com"
        "api.joox.com"
        "joox.com"
        "y.qq.com"
        "*.y.qq.com"
        "streamoc.music.tc.qq.com"
        "mobileoc.music.tc.qq.com"
        "isure.stream.qqmusic.qq.com"
        "dl.stream.qqmusic.qq.com"
        "aqqmusic.tc.qq.com"
        "amobile.music.tc.qq.com"
        "*.xiami.com"
        "*.music.migu.cn"
        "music.migu.cn"
        "+.msftconnecttest.com"
        "+.msftncsi.com"
        "localhost.ptlogin2.qq.com"
        "localhost.sec.qq.com"
        "+.qq.com"
        "+.tencent.com"
        "+.steamcontent.com"
        "+.srv.nintendo.net"
        "*.n.n.srv.nintendo.net"
        "+.cdn.nintendo.net"
        "+.stun.playstation.net"
        "xbox.*.*.microsoft.com"
        "*.*.xboxlive.com"
        "xbox.*.microsoft.com"
        "xnotify.xboxlive.com"
        "+.battlenet.com.cn"
        "+.wotgame.cn"
        "+.wggames.cn"
        "+.wowsgame.cn"
        "+.wargaming.net"
        "proxy.golang.org"
        "stun.*.*"
        "stun.*.*.*"
        "+.stun.*.*"
        "+.stun.*.*.*"
        "+.stun.*.*.*.*"
        "+.stun.*.*.*.*.*"
        "heartbeat.belkin.com"
        "*.linksys.com"
        "*.linksyssmartwifi.com"
        "*.router.asus.com"
        "mesu.apple.com"
        "swscan.apple.com"
        "swquery.apple.com"
        "swdownload.apple.com"
        "swcdn.apple.com"
        "swdist.apple.com"
        "lens.l.google.com"
        "stun.l.google.com"
        "na.b.g-tun.com"
        "+.nflxvideo.net"
        "*.square-enix.com"
        "*.finalfantasyxiv.com"
        "*.ffxiv.com"
        "*.ff14.sdo.com"
        "ff.dorado.sdo.com"
        "*.mcdn.bilivideo.cn"
        "+.media.dssott.com"
        "shark007.net"
        "Mijia Cloud"
        "+.market.xiaomi.com"
        "+.cmbchina.com"
        "+.cmbimg.com"
        "adguardteam.github.io"
        "adrules.top"
        "anti-ad.net"
        "local.adguard.org"
        "static.adtidy.org"
        "+.sandai.net"
        "+.n0808.com"
        "+.3gppnetwork.org"
        "+.uu.163.com"
        "ps.res.netease.com"
        "+.oray.com"
        "+.orayimg.com"
        "+.gcloudcs.com"
        "+.gcloudsdk.com"
        "rule-set:geosite-cn"
      ];
      nameserver-policy = {
        "+.googleapis.cn" = [
          "https://1.0.0.1/dns-query"
          "https://8.8.4.4/dns-query"
          "https://doh.opendns.com/dns-query"
        ];
      };
      nameserver = [
        "https://223.5.5.5/dns-query"
        "https://doh.pub/dns-query"
        "tls://dns.rubyfish.cn:853"
      ];
      fallback = [
        "https://1.0.0.1/dns-query"
        "https://8.8.4.4/dns-query"
        "https://doh.opendns.com/dns-query"
      ];
      fallback-filter = {
        geoip = true;
        domain = [
          "+.bing.com"
          "+.linkedin.com"
        ];
      };
    };
    hosts = {
      "time.android.com" = "203.107.6.88";
      "time.facebook.com" = "203.107.6.88";
      "*.zxc.cn" = ip.brix;
    };
    proxy-groups =
      let
        countriesTags = [
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇯🇵 日本节点"
          "🇸🇬 新加坡节点"
          "🇺🇸 美国节点"
        ];
        priceTags = [
          "👑 高级节点"
          "📉 省流节点"
        ];
        subsTags = [
          "nano"
          "knjc"
        ];
        mainTag = [ "🚀 节点选择" ];
        directTag = [ "🎯 全球直连" ];
      in
      [
        {
          name = "🚀 节点选择";
          type = "select";
          proxies = subsTags ++ countriesTags ++ priceTags;
        }
        {
          name = "📈 网络测试";
          type = "select";
          proxies = directTag ++ countriesTags ++ priceTags ++ subsTags;
        }
        {
          name = "🤖 人工智能";
          type = "select";
          proxies = mainTag ++ countriesTags;
        }
        {
          name = "📥 Trackerslist";
          type = "select";
          proxies = directTag ++ mainTag;
        }
        {
          name = "🎮 游戏服务";
          type = "select";
          proxies = directTag ++ priceTags ++ mainTag;
        }
        {
          name = "🪟 微软服务";
          type = "select";
          proxies = directTag ++ mainTag;
        }
        {
          name = "🇬 谷歌服务";
          type = "select";
          proxies = directTag ++ mainTag;
        }
        {
          name = "🍎 苹果服务";
          type = "select";
          proxies = directTag ++ mainTag;
        }
        {
          name = "🛡️ 直连域名";
          type = "select";
          proxies = directTag ++ mainTag;
        }
        {
          name = "🀄️ 直连 IP";
          type = "select";
          proxies = directTag ++ mainTag;
        }
        {
          name = "🧱 代理域名";
          type = "select";
          proxies = directTag ++ mainTag;
        }
        {
          name = "📲 电报消息";
          type = "select";
          proxies = mainTag ++ countriesTags ++ subsTags;
        }
        {
          name = "🐟 漏网之鱼";
          type = "select";
          proxies = mainTag ++ countriesTags ++ priceTags ++ subsTags ++ directTag;
        }
        {
          name = "🎯 全球直连";
          type = "select";
          proxies = [ "DIRECT" ];
        }
        (mkProxyGroup "👑 高级节点" "(?i)(专线|专用|高级|直连|急速|高倍率|游戏|game|IEPL|IPLC|AIA|CTM|CC|AC)")
        (mkProxyGroup "📉 省流节点" "(0.[1-5]|低倍率|省流|大流量)")
        (mkProxyGroup "🇭🇰 香港节点" "(?i)(🇭🇰|港|hk|hongkong|hong kong)")
        (mkProxyGroup "🇹🇼 台湾节点" "(?i)(🇹🇼|台|tw|taiwan|tai wan)")
        (mkProxyGroup "🇯🇵 日本节点" "(?i)(🇯🇵|日|jp|japan)")
        (mkProxyGroup "🇸🇬 新加坡节点" "(?i)(🇸🇬|新|sg|singapore)")
        (mkProxyGroup "🇺🇸 美国节点" "(?i)(🇺🇸|美|us|unitedstates|united states)")
        {
          name = "knjc";
          type = "url-test";
          tolerance = 100;
          lazy = true;
          use = [ "knjc" ];
        }
        {
          name = "nano";
          type = "url-test";
          tolerance = 100;
          lazy = true;
          use = [ "nano" ];
        }
      ];
    proxy-providers = {
      knjc = mkProxyProvider "knjc" config.sops.placeholder."subs/knjc" 24;
      nano = mkProxyProvider "nano" config.sops.placeholder."subs/nano" 4;
    };
    rules = [
      "RULE-SET,private,🎯 全球直连"
      "RULE-SET,trackerslist,📥 Trackerslist"
      "RULE-SET,microsoft-cn,🪟 微软服务"
      "RULE-SET,apple-cn,🍎 苹果服务"
      "RULE-SET,google-cn,🇬 谷歌服务"
      "RULE-SET,games-cn,🎮 游戏服务"
      "RULE-SET,ai,🤖 人工智能"
      "RULE-SET,networktest,📈 网络测试"
      "RULE-SET,proxy,🧱 代理域名"
      "RULE-SET,tld-cn,🛡️ 直连域名"
      "RULE-SET,cn,🛡️ 直连域名"
      "RULE-SET,privateip,🎯 全球直连,no-resolve"
      "RULE-SET,cnip,🀄️ 直连 IP"
      "RULE-SET,telegramip,📲 电报消息,no-resolve"
      "MATCH,🐟 漏网之鱼"
    ];
    rule-providers = {
      private = mkRuleProvider "private";
      trackerslist = mkRuleProvider "trackerslist";
      microsoft-cn = mkRuleProvider "microsoft-cn";
      apple-cn = mkRuleProvider "apple-cn";
      google-cn = mkRuleProvider "google-cn";
      games-cn = mkRuleProvider "games-cn";
      ai = mkRuleProvider "ai";
      networktest = mkRuleProvider "networktest";
      proxy = mkRuleProvider "proxy";
      tld-cn = mkRuleProvider "tld-cn";
      cn = mkRuleProvider "cn";
      privateip = mkRuleProvider "privateip";
      cnip = mkRuleProvider "cnip";
      telegramip = mkRuleProvider "telegramip";
      geosite-cn = {
        type = "http";
        behavior = "domain";
        format = "mrs";
        path = "./rules/geosite-cn.mrs";
        url = "https://fastly.jsdelivr.net/gh/juewuy/ShellCrash@master/bin/geodata/mrs_geosite_cn.mrs";
      };
    };
  };
  value = {
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
    sops.templates.mihomo.content = builtins.toJSON settings;
    services.mihomo = enabled // {
      tunMode = true;
      configFile = config.sops.templates.mihomo.path;
    };
    systemd.services.mihomo =
      let
        joinLines = builtins.concatStringsSep "\n";
        inherit (builtins) map;
        ipTableMark = "100";
        ipTableMarkV6 = "101";
        routeStart = pkgs.writeShellScript "routeStart" (
          if isTproxy then
            ''
              ip rule add fwmark ${FirewallMark} lookup ${ipTableMark}
              ip route add local default dev lo table ${ipTableMark}
              ip -6 rule add fwmark ${FirewallMark} lookup ${ipTableMarkV6}
              ip -6 route add local default dev lo table ${ipTableMarkV6}
            ''
          else
            ""
        );
        routeStop = pkgs.writeShellScript "routeStop" (
          if isTproxy then
            ''
              ip rule del fwmark ${FirewallMark} table ${ipTableMark} 2>/dev/null
              ip route flush table ${ipTableMark} 2>/dev/null
              ip -6 rule del fwmark ${FirewallMark} table ${ipTableMarkV6} 2>/dev/null
              ip -6 route flush table ${ipTableMarkV6} 2>/dev/null
            ''
          else
            ""
        );
        natTableDns = "sing-box_nat_dns";
        natTable = "sing-box_nat";
        natStart = pkgs.writeShellScript "natStart" (
          joinLines (
            if isTproxy then
              map (x: "iptables -w -t nat ${x}") [
                "-N ${natTable}"
                "-A PREROUTING -p udp -m udp --dport 53 -j ${natTable}"
                "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTable}"
                "-A ${natTable} -m mark --mark ${toString routingMark} -j RETURN"
                "-A ${natTable} -s ${subnet} -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
                "-A ${natTable} -s ${subnet} -p udp -j REDIRECT --to-ports ${toString dnsPort}"
              ]
            else
              map (x: "ip6tables -w -t nat ${x}") (
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
                ++ map (x: "-A ${natTable} -d ${x} -j RETURN") reservedSubnets
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
              host_ipv6=$(ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
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
              host_ipv6=$(ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
              for ip in $host_ipv6; do
                  ip6tables -w -t nat -A ${natTableV6Dns} -s "$ip" -p tcp -j REDIRECT --to-ports ${toString dnsPort}
                  ip6tables -w -t nat -A ${natTableV6Dns} -s "$ip" -p udp -j REDIRECT --to-ports ${toString dnsPort}
              done
            ''
            + "\n"
            + map (x: "ip6tables -w -t nat ${x}") [
              "-A ${natTableV6Dns} -p tcp -j RETURN"
              "-A ${natTableV6Dns} -p udp -j RETURN"
            ]
        );
        natStopV6 = pkgs.writeShellScript "natStopV6" (
          joinLines (
            if isTproxy then
              (map (x: "ip6tables -w -t nat ${x}") ([
                "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableV6}"
                "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6}"
                "-F ${natTableV6}"
                "-X ${natTableV6}"
              ]))
            else
              map (x: "ip6tables -w -t nat ${x}") ([
                "-D PREROUTING -p udp -m udp --dport 53 -j ${natTableV6Dns}"
                "-D PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6Dns}"
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
            map (x: "iptables -w -t mangle ${x}") (
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
              ++ (map (x: "-A ${mangleTable} -d ${x} -j RETURN") reservedSubnets)
              ++ [
                "-A ${mangleTable} -s ${subnet} -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip 0.0.0.0 --tproxy-mark ${FirewallMark}"
                "-A ${mangleTable} -s ${subnet} -p udp -j TPROXY --on-port ${toString tproxyPort} --on-ip 0.0.0.0 --tproxy-mark ${FirewallMark}"
              ]
            )
          )
        );
        mangleStop = pkgs.writeShellScript "mangleStop" (
          joinLines (
            map (x: "iptables -w -t mangle ${x}") ([
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
            map (x: "ip6tables -w -t mangle ${x}") (
              [
                "-N ${mangleTableV6}"
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
            host_ipv6=$(ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
            for ip in $host_ipv6; do
                ip6tables -w -t mangle -A ${mangleTableV6} -s "$ip" -p udp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}
                ip6tables -w -t mangle -A ${mangleTableV6} -s "$ip" -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip :: --tproxy-mark ${FirewallMark}
            done
          ''
        );
        mangleStopV6 = pkgs.writeShellScript "mangleStopV6" (
          joinLines (
            map (x: "ip6tables -w -t mangle ${x}") ([
              "-D PREROUTING -p udp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
              "-D PREROUTING -p tcp -m multiport --dports ${proxyPorts'} -j ${mangleTableV6}"
              "-F ${mangleTableV6}"
              "-X ${mangleTableV6}"
            ])
          )
        );
        filterStart = pkgs.writeShellScript "filterStart" (
          joinLines (
            map (x: "iptables -w -t filter ${x}") (
              map (x: "-A INPUT -s ${x} -p tcp -m tcp --dport ${toString apiPort} -j ACCEPT") reservedSubnets
              ++ map (x: "-A INPUT -s ${x} -p tcp -m tcp --dport ${toString mixPort} -j ACCEPT") reservedSubnets
              ++ [
                "-A INPUT -p tcp -m tcp --dport ${toString apiPort} -j REJECT --reject-with icmp-port-unreachable"
                "-A INPUT -p tcp -m tcp --dport ${toString mixPort} -j REJECT --reject-with icmp-port-unreachable"
              ]
            )
          )
        );
        filterStop = pkgs.writeShellScript "filterStop" (
          joinLines (
            map (x: "iptables -w -t filter ${x}") (
              map (x: "-D INPUT -s ${x} -p tcp -m tcp --dport ${toString apiPort} -j ACCEPT") reservedSubnets
              ++ map (x: "-D INPUT -s ${x} -p tcp -m tcp --dport ${toString mixPort} -j ACCEPT") reservedSubnets
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
              host_ipv6=$(ip a 2>&1 | grep -w 'inet6' | grep -E 'global' | sed 's/.*inet6.//g' | sed 's/scope.*$//g')
              [ -n "$host_ipv6" ] && break
              sleep 1 && i=$((i + 1))
          done
        '';
      in
      {
        path = with pkgs; [
          iptables
          iproute2
        ];
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
    ${namespace}.user.ports = [
      apiPort
      tproxyPort
      redirectPort
      dnsPort
      mixPort
    ];
  };
  path = ./.;
  extraOpts = {
    mode = mkOpt' (lib.types.enum [
      "tproxy"
      "redirect"
    ]) "tproxy";
  };
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
