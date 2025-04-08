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
    fakeIpExclude
    domainBlackList
    domainWhiteList
    ;
  inherit (lib.${namespace}.mihomo) mkProxyProvider RuleProviders proxyGroups;
  inherit (lib.${namespace}.sing-box) mkFirewall;
  inherit (builtins) mapAttrs toJSON map;
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
        "223.5.5.5"
        "114.114.114.114"
      ];
      enhanced-mode = "fake-ip";
      fake-ip-range = fakeIpSubnet;
      fake-ip-filter = (map (v: "*.${v}") fakeIpExclude) ++ [
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
        "rule-set:tld-cn"
        "rule-set:cn"
      ];
      nameserver-policy = {
        "+.googleapis.cn" = [
          "https://1.0.0.1/dns-query"
          "https://8.8.4.4/dns-query"
          "https://doh.opendns.com/dns-query"
        ];
        "+.jsdelivr.net" = [
          "223.5.5.5"
          "114.114.114.114"
        ];
      };
      nameserver = [
        "https://dns.alidns.com/dns-query"
        "https://doh.pub/dns-query"
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
      [ proxyGroups.main ]
      ++ proxyGroups.subs
      ++ proxyGroups.freeSubs
      ++ [
        proxyGroups.ai
        proxyGroups.trackerslist
        proxyGroups.game
        proxyGroups.microsoft
        proxyGroups.google
        proxyGroups.apple
        proxyGroups.private
        proxyGroups.privateip
        proxyGroups.proxy
        proxyGroups.telegram
        proxyGroups.final
        proxyGroups.direct
      ]
      ++ proxyGroups.price
      ++ proxyGroups.countries;
    proxy-providers = {
      knjc = mkProxyProvider "knjc" config.sops.placeholder."subs/knjc" 24;
      nano = mkProxyProvider "nano" config.sops.placeholder."subs/nano" 4;
    } // mapAttrs (_: v: mkProxyProvider v.name v.url v.updateInterval) freeSubs;
    rules =
      (map (v: "DOMAIN-SUFFIX,${v},${proxyGroups.direct.name}") domainWhiteList)
      ++ (map (v: "DOMAIN-SUFFIX,${v},${proxyGroups.proxy.name}") domainBlackList)
      ++ [
        "RULE-SET,${RuleProviders.private.tag},${proxyGroups.direct.name}"
        "RULE-SET,${RuleProviders.trackerslist.tag},${proxyGroups.trackerslist.name}"
        "RULE-SET,${RuleProviders.microsoft-cn.tag},${proxyGroups.microsoft.name}"
        "RULE-SET,${RuleProviders.apple-cn.tag},${proxyGroups.apple.name}"
        "RULE-SET,${RuleProviders.google-cn.tag},${proxyGroups.google.name}"
        "RULE-SET,${RuleProviders.games-cn.tag},${proxyGroups.game.name}"
        "RULE-SET,${RuleProviders.ai.tag},${proxyGroups.ai.name}"
        "RULE-SET,${RuleProviders.proxy.tag},${proxyGroups.proxy.name}"
        "RULE-SET,${RuleProviders.tld-cn.tag},${proxyGroups.private.name}"
        "RULE-SET,${RuleProviders.cn.tag},${proxyGroups.private.name}"
        "RULE-SET,${RuleProviders.privateip.tag},${proxyGroups.direct.name},no-resolve"
        "RULE-SET,${RuleProviders.telegramip.tag},${proxyGroups.telegram.name},no-resolve"
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
