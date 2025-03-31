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
    ip
    domain
    freeSubs
    ;
  inherit (lib.${namespace}.mihomo) mkProxyProvider RuleProviders mkProxyGroup;
  inherit (lib.${namespace}.sing-bxo) mkFirewall;
  inherit (builtins) mapAttrs toJSON;
  cfg = cfgNixos config.${namespace} ./.;
  isTproxy = cfg.mode == "tproxy";
  apiPort = 9999;
  tproxyPort = 7893;
  redirectPort = 7892;
  dnsPort = 1053;
  mixPort = 7890;
  routingMark = 255;
  fakeIpSubnet = "198.18.0.0/16";
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
      "*.${domain}" = ip.brix;
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
        subsTags =
          [
            "nano"
            "knjc"
            "tenCloud"
          ]
          ++ lib.attrsets.foldlAttrs (
            acc: _: value:
            acc ++ [ value.name ]
          ) [ ] freeSubs;
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
        {
          name = "tenCloud";
          type = "url-test";
          tolerance = 100;
          lazy = true;
          use = [ "tenCloud" ];
        }
      ];
    proxy-providers = {
      knjc = mkProxyProvider "knjc" config.sops.placeholder."subs/knjc" 24;
      nano = mkProxyProvider "nano" config.sops.placeholder."subs/nano" 4;
      tenCloud = mkProxyProvider "tenCloud" config.sops.placeholder."subs/tenCloud" 24;
    } // mapAttrs (_: v: mkProxyProvider v.name v.url v.updateInterval) freeSubs;
    rules = [
      "RULE-SET,${RuleProviders.private.tag},🎯 全球直连"
      "RULE-SET,${RuleProviders.trackerslist.tag},📥 Trackerslist"
      "RULE-SET,${RuleProviders.microsoft-cn.tag},🪟 微软服务"
      "RULE-SET,${RuleProviders.apple-cn.tag},🍎 苹果服务"
      "RULE-SET,${RuleProviders.google-cn.tag},🇬 谷歌服务"
      "RULE-SET,${RuleProviders.games-cn.tag},🎮 游戏服务"
      "RULE-SET,${RuleProviders.ai.tag},🤖 人工智能"
      "RULE-SET,${RuleProviders.networktest.tag},📈 网络测试"
      "RULE-SET,${RuleProviders.proxy.tag},🧱 代理域名"
      "RULE-SET,${RuleProviders.tld-cn.tag},🛡️ 直连域名"
      "RULE-SET,${RuleProviders.cn.tag},🛡️ 直连域名"
      "RULE-SET,${RuleProviders.privateip.tag},🎯 全球直连,no-resolve"
      "RULE-SET,${RuleProviders.cnip.tag},🀄️ 直连 IP"
      "RULE-SET,${RuleProviders.telegramip.tag},📲 电报消息,no-resolve"
      "MATCH,🐟 漏网之鱼"
    ];
    rule-providers = lib.attrsets.filterAttrsRecursive (n: v: n != "tag") RuleProviders;
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
    sops.templates.mihomo.content = toJSON settings;
    services.mihomo = enabled // {
      tunMode = true;
      configFile = config.sops.templates.mihomo.path;
    };
    systemd.services.mihomo =
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
            routingMark
            ;
          name = "mihomo";
          fakeIp6Subnet = "";
          FirewallMark = toString 1;
          ipTableMark = "100";
          ipTableMarkV6 = "101";
        };
        firewallStart = pkgs.writeShellScript "mihomoFirewallStart" firewallScripts.start;
        firewallStop = pkgs.writeShellScript "mihomoFirewallStop" firewallScripts.stop;
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
