{ lib, namespace, ... }:
let
  inherit (builtins) concatStringsSep map attrValues;
  mkOutboundSub =
    tag: type:
    {
      inherit type;
      providers = tag;
      includes = ".*";
      excludes = lib.${namespace}.subsExcludes;
      inherit tag;
    }
    // lib.optionalAttrs (type == "urltest") { tolerance = 100; };
  freeSubs = map (x: mkOutboundSub x.name "selector") (
    attrValues (lib.${namespace}.freeSubs { isMihomo = false; })
  );
  subs = [
    (mkOutboundSub "knjc" "urltest")
    (mkOutboundSub "nano" "urltest")
  ]
  ++ freeSubs;
  getTag = map (x: x.tag);
  outbounds =
    let
      mkOutbound = tag: includes: {
        type = "urltest";
        use_all_providers = true;
        inherit tag includes;
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
      global = {
        type = "selector";
        tag = "GLOBAL";
        outbounds = [ direct.tag ] ++ countriesTags ++ subsTags ++ [ manual.tag ];
      };
      dns = {
        type = "dns";
        tag = "dns-out";
      };
      direct = {
        type = "direct";
        tag = "DIRECT";
      };
      ad = {
        type = "selector";
        tag = "🛑 广告拦截";
        outbounds = getTag [
          block
          direct
        ];
      };
      block = {
        type = "block";
        tag = "REJECT";
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
    outbounds.ai
    outbounds.games
    outbounds.microsoft
    outbounds.google
    outbounds.apple
    outbounds.networktest
    outbounds.netflix
    outbounds.ad
    outbounds.global
    outbounds.direct
    outbounds.block
    outbounds.dns
  ];
  dnsServers = rec {
    direct = {
      tag = "dns_direct";
      address = "https://223.5.5.5/dns-query";
      address_resolver = resolver.tag;
      strategy = "prefer_ipv4";
      detour = outbounds.direct.tag;
    };
    proxy = {
      tag = "dns_proxy";
      address = "https://1.0.0.1/dns-query";
      address_resolver = resolver.tag;
    };
    resolver = {
      tag = "dns_resolver";
      address = "223.5.5.5";
      detour = outbounds.direct.tag;
    };
    fakeip = {
      tag = "dns_fakeip";
      address = "fakeip";
    };
    block = {
      tag = "block";
      address = "rcode://success";
    };
    local = {
      tag = "local";
      address = "local";
      detour = outbounds.direct.tag;
    };
    hosts_local = {
      tag = "hosts_local";
      address = "local";
      detour = outbounds.direct.tag;
    };
  };
  ruleSet =
    let
      go = tag: {
        inherit tag;
        type = "remote";
        format = "binary";
        url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset-compatible/${tag}.srs";
        download_detour = outbounds.direct.tag;
      };
    in
    {
      private = go "private";
      ai = go "ai";
      microsoft = go "microsoft-cn";
      apple = go "apple-cn";
      google = go "google-cn";
      games = go "games-cn";
      networktest = go "networktest";
      proxy = go "proxy";
      cn = go "cn";
      telegram = go "telegramip";
      cn_ip = go "cnip";
      ads = go "ads";
      youtube = go "youtube";
      netflix = go "netflix";
      netflix_ip = go "netflixip";
    };
  host_ip = ''
    host_ipv4=$(ip -o -f inet addr show | grep -Ev 'utun|iot|peer|docker|podman|virbr|vnet|ovs|vmbr|veth|vmnic|vboxnet|lxcbr|xenbr|vEthernet' | grep -E ' 1(92|0|72)\.' | awk '/scope global/ {print $4}')
    host_ipv6=$(ip -6 route show | grep -Ev 'default|unreachable|fe80::/|wan|ppp|utun|iot|peer|docker|podman|virbr|vnet|ovs|vmbr|veth|vmnic|vboxnet|lxcbr|xenbr|vEthernet|wgs|multicast|anycast' | awk '{print $1}' | tr '\n' ' ' | sed 's/ $//')
  '';
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
        outbound = [ "any" ];
        server = dnsServers.direct.tag;
      }
      {
        clash_mode = "Global";
        server = dnsServers.fakeip.tag;
        rewrite_ttl = 1;
      }
      {
        clash_mode = "Direct";
        server = dnsServers.direct.tag;
      }
      {
        domain = [
          "time-ios.apple.com"
          "time1.cloud.tencent.com"
          "music.163.com"
          "musicapi.taihe.com"
          "music.taihe.com"
          "songsearch.kugou.com"
          "trackercdn.kugou.com"
          "api-jooxtt.sanook.com"
          "api.joox.com"
          "joox.com"
          "y.qq.com"
          "streamoc.music.tc.qq.com"
          "mobileoc.music.tc.qq.com"
          "isure.stream.qqmusic.qq.com"
          "dl.stream.qqmusic.qq.com"
          "aqqmusic.tc.qq.com"
          "amobile.music.tc.qq.com"
          "music.migu.cn"
          "localhost.ptlogin2.qq.com"
          "localhost.sec.qq.com"
          "xnotify.xboxlive.com"
          "proxy.golang.org"
          "heartbeat.belkin.com"
          "mesu.apple.com"
          "swscan.apple.com"
          "swquery.apple.com"
          "swdownload.apple.com"
          "swcdn.apple.com"
          "swdist.apple.com"
          "lens.l.google.com"
          "stun.l.google.com"
          "na.b.g-tun.com"
          "ff.dorado.sdo.com"
          "shark007.net"
          "adguardteam.github.io"
          "adrules.top"
          "anti-ad.net"
          "local.adguard.org"
          "static.adtidy.org"
          "ps.res.netease.com"
        ];
        server = dnsServers.direct.tag;
      }
      {
        domain_suffix = [
          "lan"
          "localdomain"
          "example"
          "invalid"
          "localhost"
          "test"
          "local"
          "home.arpa"
          "time.edu.cn"
          "ntp.org.cn"
          "pool.ntp.org"
          "music.163.com"
          "126.net"
          "kuwo.cn"
          "y.qq.com"
          "xiami.com"
          "music.migu.cn"
          "msftconnecttest.com"
          "msftncsi.com"
          "qq.com"
          "tencent.com"
          "steamcontent.com"
          "srv.nintendo.net"
          "n.n.srv.nintendo.net"
          "cdn.nintendo.net"
          "stun.playstation.net"
          "battlenet.com.cn"
          "wotgame.cn"
          "wggames.cn"
          "wowsgame.cn"
          "wargaming.net"
          "linksys.com"
          "linksyssmartwifi.com"
          "router.asus.com"
          "nflxvideo.net"
          "square-enix.com"
          "finalfantasyxiv.com"
          "ffxiv.com"
          "ff14.sdo.com"
          "mcdn.bilivideo.cn"
          "media.dssott.com"
          "market.xiaomi.com"
          "cmbchina.com"
          "cmbimg.com"
          "sandai.net"
          "n0808.com"
          "3gppnetwork.org"
          "uu.163.com"
          "oray.com"
          "orayimg.com"
          "gcloudcs.com"
          "gcloudsdk.com"
        ];
        server = dnsServers.direct.tag;
      }
      {
        domain_regex = [
          "time.*.com"
          "time.*.gov"
          "time.*.edu.cn"
          "time.*.apple.com"
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
          "xbox.*.*.microsoft.com"
          ".*.*.xboxlive.com"
          "xbox.*.microsoft.com"
          "stun.*.*"
          "stun.*.*.*"
          ".+.stun.*.*"
          ".+.stun.*.*.*"
          ".+.stun.*.*.*.*"
          ".+.stun.*.*.*.*.*"
        ];
        server = dnsServers.direct.tag;
      }
      {
        rule_set = ruleSet.cn.tag;
        server = dnsServers.direct.tag;
      }
      {
        query_type = [
          "A"
          "AAAA"
        ];
        server = dnsServers.fakeip.tag;
        rewrite_ttl = 1;
      }
    ];
    routeRules = [
      {
        inbound = "dns-in";
        outbound = outbounds.dns.tag;
      }
      {
        clash_mode = "Global";
        outbound = outbounds.global.tag;
      }
      {
        clash_mode = "Direct";
        outbound = outbounds.direct.tag;
      }
      {
        rule_set = ruleSet.private.tag;
        outbound = outbounds.foreign.tag;
      }
      {
        rule_set = ruleSet.ai.tag;
        outbound = outbounds.ai.tag;
      }
      {
        rule_set = ruleSet.microsoft.tag;
        outbound = outbounds.microsoft.tag;
      }
      {
        rule_set = ruleSet.apple.tag;
        outbound = outbounds.apple.tag;
      }
      {
        rule_set = ruleSet.google.tag;
        outbound = outbounds.google.tag;
      }
      {
        rule_set = ruleSet.games.tag;
        outbound = outbounds.games.tag;
      }
      {
        rule_set = ruleSet.networktest.tag;
        outbound = outbounds.networktest.tag;
      }
      {
        rule_set = ruleSet.youtube.tag;
        outbound = outbounds.youtube.tag;
      }
      {
        rule_set = ruleSet.proxy.tag;
        outbound = outbounds.main.tag;
      }
      {
        rule_set = ruleSet.cn.tag;
        outbound = outbounds.direct.tag;
      }
      {
        rule_set = ruleSet.telegram.tag;
        outbound = outbounds.telegram.tag;
      }
      {
        rule_set = ruleSet.netflix.tag;
        outbound = outbounds.netflix.tag;
      }
      {
        rule_set = ruleSet.netflix_ip.tag;
        outbound = outbounds.netflix.tag;
      }
      {
        rule_set = ruleSet.cn_ip.tag;
        outbound = outbounds.direct.tag;
      }
      {
        rule_set = ruleSet.ads.tag;
        outbound = outbounds.ad.tag;
      }
      {
        rule_set = ruleSet.youtube.tag;
        outbound = outbounds.youtube.tag;
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
        download_ua = "clash.meta";
        download_interval = "${toString hour}h${toString minute}m0s";
        healthcheck_url = "https://www.gstatic.com/generate_204";
        healthcheck_interval = "10m0s";
        download_detour = outbounds.direct.tag;
        inherit tag;
        path = "./providers/${tag}.yaml";
        download_url = url;
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
            proxySSH = false;
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
        isTailscale ? false,
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
        ],
      }:
      let
        validFakeIp = fakeIpSubnet != "";
        validFakeIp6 = fakeIp6Subnet != "";
        joinLines = concatStringsSep "\n";
        proxyPorts' = concatStringsSep "," (map toString proxyPorts);
        waitWan = ''
          i=1
          while [ "$i" -le "20" ]; do
              host_ipv4=$(ip -o -f inet addr show | grep -Ev 'utun|iot|peer|docker|podman|virbr|vnet|ovs|vmbr|veth|vmnic|vboxnet|lxcbr|xenbr|vEthernet' | grep -E ' 1(92|0|72)\.' | awk '/scope global/ {print $4}')
              host_ipv6=$(ip -o -f inet6 addr show | awk '/scope global/ {print $4}')
              [ -n "$host_ipv6" ] && [ -n "$host_ipv4" ] && break
              sleep 1 && i=$((i + 1))
          done

          $host_ipv4+=" 127.0.0.0/8"
        ''
        + (
          if isTailscale then
            ''
              $host_ipv4+=" 100.64.0.0/10"
              $host_ipv6+=" fd7a:115c:a1e0::/48"
            ''
          else
            ""
        );
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
            ++ map (x: "ip6tables -w -t nat ${x}") (
              (map (x: "-A ${natTable} -d ${x} -j RETURN") reservedSubnets)
              ++ [ "-A ${natTableDns} -m mark --mark ${FirewallMark} -j RETURN" ]
            )
            ++ [
              "for ipv6 in $host_ipv6; do"
              "ip6tables -w -t nat -A ${natTable} -d $ipv6 -j RETURN"
              "ip6tables -w -t nat -A ${natTable} -s $ipv6 -p tcp -j REDIRECT --to-ports ${toString redirectPort}"
              "ip6tables -w -t nat -A ${natTable} -s $ipv6 -p udp -j REDIRECT --to-ports ${toString redirectPort}"
              "done"
            ]
            ++ [
              "for ipv6 in $host_ipv6; do"
              "ip6tables -w -t nat -A ${natTableDns} -s $ipv6 -p tcp -j REDIRECT --to-ports ${toString dnsPort}"
              "ip6tables -w -t nat -A ${natTableDns} -s $ipv6 -p udp -j REDIRECT --to-ports ${toString dnsPort}"
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
            joinLines (
              map (x: "ip6tables -w -t nat ${x}") ([
                "-N ${natTableV6}"
                "-A PREROUTING -p udp -m udp --dport 53 -j ${natTableV6}"
                "-A PREROUTING -p tcp -m tcp --dport 53 -j ${natTableV6}"
                "-A ${natTableV6} -m mark --mark ${FirewallMark} -j RETURN"
              ])
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
              ++ (map (x: "iptables -w -t mangle ${x}") (
                map (x: "-A ${mangleTable} -d ${x} -j RETURN") reservedSubnets
              ))
              ++ [
                "for ipv4 in $host_ipv4; do"
                "iptables -w -t mangle -A ${mangleTable} -d $ipv4 -j RETURN"
                "iptables -w -t mangle -A ${mangleTable} -s $ipv4 -p tcp -j TPROXY --on-port ${toString tproxyPort} --on-ip 0.0.0.0 --tproxy-mark ${FirewallMark}"
                "done"
              ]
            ))
          else
            "";
        mangleStop =
          if isTproxy then
            (joinLines (
              (map (x: "iptables -w -t mangle ${x}") (
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
              ))
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
    tproxy_start =
      {
        isTailscale ? false,
        firewall_mark ? 1,
        tproxyPort ? 7893,
        dnsPort ? 1053,
        mark ? 255,
        fakeip ? "",
        fakeipV6 ? "",
        dailyPorts ? true,
      }:
      let
        tailscale =
          if isTailscale then
            ''
              # tailscale
              host_ipv4+=" 100.64.0.0/10"
              host_ipv6+=" fd7a:115c:a1e0::/48"
            ''
          else
            "";
        ip_taleb_mark = 100;
        ipv6_taleb_mark = 101;
        dns_table_name = "sing_box_dns";
        dns_v6_table_name = "sing_box_dns_v6";
        mark_table_name = "sing_box_mark";
        mark_v6_table_name = "sing_box_mark_v6";
      in
      ''
        mark=${toString mark}
        firewall_mark=${toString firewall_mark}
        daily_ports=${toString (if dailyPorts then 1 else 0)}
        fakeip=${fakeip}
        fakeipV6=${fakeipV6}

        # waiting network
        i=1
        while [ "$i" -le "20" ]; do
          ${host_ip}
          [ -n "$host_ipv6" ] && [ -n "$host_ipv4" ] && break
          sleep 1 && i=$((i + 1))
        done

        host_ipv4+=" 127.0.0.0/8"
        host_ipv6+=" fe80::/10 fd00::/8"

        ${tailscale}

        # route
        ip_taleb_mark=${toString ip_taleb_mark}
        ipv6_taleb_mark=${toString ipv6_taleb_mark}

        ip rule add fwmark "$firewall_mark" lookup "$ip_taleb_mark"
        ip route add local default dev lo table "$ip_taleb_mark"
        ip -6 rule add fwmark "$firewall_mark" lookup "$ipv6_taleb_mark"
        ip -6 route add local default dev lo table "$ipv6_taleb_mark"

        dns_table=${dns_table_name}
        dns_v6_table=${dns_v6_table_name}

        # nat
        iptables -w -t nat -N "$dns_table"
        for p in tcp udp; do
          iptables -w -t nat -A PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_table"
        done
        iptables -w -t nat -A "$dns_table" -m mark --mark "$mark" -j RETURN

        ip6tables -w -t nat -N "$dns_v6_table"
        for p in tcp udp; do
          ip6tables -w -t nat -A PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_v6_table"
        done
        ip6tables -w -t nat -A "$dns_v6_table" -m mark --mark "$mark" -j RETURN

        dns_port=${toString dnsPort}

        for ipv4 in $host_ipv4; do
          for p in tcp udp; do
            iptables -w -t nat -A "$dns_table" -s "$ipv4" -p "$p" -j REDIRECT --to-ports "$dns_port"
          done
        done

        for ipv6 in $host_ipv6; do
          for p in tcp udp; do
            ip6tables -w -t nat -A "$dns_table" -s "$ipv6" -p "$p" -j REDIRECT --to-ports "$dns_port"
          done
        done

        for p in tcp udp; do
          ip6tables -w -t nat -A "$dns_v6_table" -t "$p" -j RETURN
        done

        # filter
        for ipv4 in $host_ipv4; do
          iptables -w -t filter -A INPUT -s "$ipv4" -j ACCEPT
        done

        for p in tcp udp; do
          iptables -w -t filter -A INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done

        for ipv6 in $host_ipv6; do
          ip6tables -w -t filter -A INPUT -s "$ipv6" -j ACCEPT
        done

        for p in tcp udp; do
          ip6tables -w -t filter -A INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done

        mark_table=${mark_table_name}
        mark_v6_table=${mark_v6_table_name}

        # mangle
        iptables -w -t mangle -N "$mark_table"

        ip6tables -w -t mangle -N "$mark_v6_table"

        for p in tcp udp; do
          if [[ -n $fakeip ]]; then
            iptables -w -t mangle -A PREROUTING -d "$fakeip" -p "$p" -j "$mark_table"
          fi
          if (( daily_ports )); then
            iptables -w -t mangle -A PREROUTING -p "$p" -m multiport --dports 22,80,443,8080,8443 -j "$mark_table"
          else
            iptables -w -t mangle -A PREROUTING -p "$p" -m "$p" -j "$mark_table"
          fi
        done

        for p in tcp udp; do
          if [[ -n $fakeipV6 ]]; then
            ip6tables -w -t mangle -A PREROUTING -d "$fakeipV6" -p "$p" -j "$mark_v6_table"
          fi
          if (( daily_ports )); then
            ip6tables -w -t mangle -A PREROUTING -p "$p" -m multiport --dports 22,80,443,8080,8443 -j "$mark_v6_table"
          else
            ip6tables -w -t mangle -A PREROUTING -p "$p" -m "$p" -j "$mark_v6_table"
          fi
        done

        for p in tcp udp; do
          iptables -w -t mangle -A "$mark_table" -p "$p" -m "$p" --dport 53 -j RETURN
        done

        for p in tcp udp; do
          ip6tables -w -t mangle -A "$mark_v6_table" -p "$p" -m "$p" --dport 53 -j RETURN
        done

        iptables -w -t mangle -A "$mark_table" -m mark --mark "$mark" -j RETURN

        ip6tables -w -t mangle -A "$mark_v6_table" -m mark --mark "$mark" -j RETURN

        for ipv4 in $host_ipv4; do
          iptables -w -t mangle -A "$mark_table" -d "$ipv4" -j RETURN
        done

        for ipv6 in $host_ipv6; do
          ip6tables -w -t mangle -A "$mark_v6_table" -d "$ipv6" -j RETURN
        done

        reseved_subnets=("0.0.0.0/8" "10.0.0.0/8" "127.0.0.0/8" "100.64.0.0/10" "169.254.0.0/16" "172.16.0.0/12" "192.168.0.0/16" "224.0.0.0/4" "240.0.0.0/4")
        for subnet in "''${reseved_subnets[@]}"; do
          iptables -w -t mangle -A "$mark_table" -d "$subnet" -j RETURN
        done

        reseved_subnets_v6=("fe80::/10" "fd00::/8" "::/128" "::1/128" "::ffff:0.0.0.0/96" "64:ff9b::/96" "100::/64" "2001::/32" "2001:20::/28" "2001:db8::/32" "2002::/16")
        for subnet in "''${reseved_subnets_v6[@]}"; do
          ip6tables -w -t mangle -A "$mark_v6_table" -d "$subnet" -j RETURN
        done

        tproxy_port=${toString tproxyPort}

        for ipv4 in $host_ipv4; do
          for p in tcp udp; do
            iptables -w -t mangle -A "$mark_table" -s "$ipv4" -p "$p" -j TPROXY --on-port "$tproxy_port" --on-ip 0.0.0.0 --tproxy-mark "$firewall_mark"
          done
        done

        for ipv6 in $host_ipv6; do
          for p in tcp udp; do
            ip6tables -w -t mangle -A "$mark_v6_table" -s "$ipv6" -p "$p" -j TPROXY --on-port "$tproxy_port" --on-ip :: --tproxy-mark "$firewall_mark"
          done
        done
      '';
    tproxy_stop =
      {
        isTailscale ? false,
        firewall_mark ? 1,
        fakeip ? "",
        fakeipV6 ? "",
        dailyPorts ? true,
      }:
      let
        tailscale =
          if isTailscale then
            ''
              # tailscale
              host_ipv4+=" 100.64.0.0/10"
              host_ipv6+=" fd7a:115c:a1e0::/48"
            ''
          else
            "";
        ip_taleb_mark = 100;
        ipv6_taleb_mark = 101;
        dns_table_name = "sing_box_dns";
        dns_v6_table_name = "sing_box_dns_v6";
        mark_table_name = "sing_box_mark";
        mark_v6_table_name = "sing_box_mark_v6";
      in
      ''
        firewall_mark=${toString firewall_mark}
        daily_ports=${toString (if dailyPorts then 1 else 0)}
        fakeip=${fakeip}
        fakeipV6=${fakeipV6}

        ${host_ip}

        host_ipv4+=" 127.0.0.0/8"
        host_ipv6+=" fe80::/10 fd00::/8"

        ${tailscale}

        # route
        ip_taleb_mark=${toString ip_taleb_mark}
        ipv6_taleb_mark=${toString ipv6_taleb_mark}

        ip rule del fwmark "$firewall_mark" table "$ip_taleb_mark" 2>/dev/null
        ip route flush table "$ip_taleb_mark" 2>/dev/null
        ip -6 rule del fwmark "$firewall_mark" table "$ipv6_taleb_mark" 2>/dev/null
        ip -6 route flush table "$ipv6_taleb_mark" 2>/dev/null

        dns_table=${dns_table_name}
        dns_v6_table=${dns_v6_table_name}

        # nat
        for p in tcp udp; do
          iptables -w -t nat -D PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_table"
        done
        iptables -w -t nat -F "$dns_table"
        iptables -w -t nat -X "$dns_table"

        for p in tcp udp; do
          ip6tables -w -t nat -D PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_v6_table"
        done
        ip6tables -w -t nat -F "$dns_v6_table"
        ip6tables -w -t nat -X "$dns_v6_table"

        # filter
        for ipv4 in $host_ipv4; do
          iptables -w -t filter -D INPUT -s "$ipv4" -j ACCEPT
        done

        for p in tcp udp; do
          iptables -w -t filter -D INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done

        for ipv6 in $host_ipv6; do
          ip6tables -w -t filter -D INPUT -s "$ipv6" -j ACCEPT
        done

        for p in tcp udp; do
          ip6tables -w -t filter -D INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done

        mark_table=${mark_table_name}
        mark_v6_table=${mark_v6_table_name}

        # mangle
        for p in tcp udp; do
          if [[ -n $fakeip ]]; then
            iptables -w -t mangle -D PREROUTING -d "$fakeip" -p "$p" -j "$mark_table"
          fi
          if (( daily_ports )); then
            iptables -w -t mangle -D PREROUTING -p "$p" -m multiport --dports 22,80,443,8080,8443 -j "$mark_table"
          else
            iptables -w -t mangle -D PREROUTING -p "$p" -m "$p" -j "$mark_table"
          fi
        done

        for p in tcp udp; do
          if [[ -n $fakeipV6 ]]; then
            ip6tables -w -t mangle -D PREROUTING -d "$fakeipV6" -p "$p" -j "$mark_v6_table"
          fi
          if (( daily_ports )); then
            ip6tables -w -t mangle -D PREROUTING -p "$p" -m multiport --dports 22,80,443,8080,8443 -j "$mark_v6_table"
          else
            ip6tables -w -t mangle -D PREROUTING -p "$p" -m "$p" -j "$mark_v6_table"
          fi
        done

        iptables -w -t mangle -F "$mark_table"
        iptables -w -t mangle -X "$mark_table"

        ip6tables -w -t mangle -F "$mark_v6_table"
        ip6tables -w -t mangle -X "$mark_v6_table"
      '';
    redir_start =
      {
        isTailscale ? false,
        redirPort ? 7892,
        dnsPort ? 1053,
        mark ? 255,
        fakeip ? "",
        fakeipV6 ? "",
        dailyPorts ? true,
      }:
      let
        tailscale =
          if isTailscale then
            ''
              # tailscale
              host_ipv4+=" 100.64.0.0/10"
              host_ipv6+=" fd7a:115c:a1e0::/48"
            ''
          else
            "";
        dns_table_name = "sing_box_dns";
        dns_v6_table_name = "sing_box_dns_v6";
        mark_table_name = "sing_box_mark";
        mark_v6_table_name = "sing_box_mark_v6";
      in
      ''
        mark=${toString mark}
        daily_ports=${toString (if dailyPorts then 1 else 0)}
        fakeip=${fakeip}
        fakeipV6=${fakeipV6}

        i=1
        while [ "$i" -le "20" ]; do
          ${host_ip}
          sleep 1 && i=$((i + 1))
        done

        host_ipv4+=" 127.0.0.0/8"
        host_ipv6+=" fe80::/10 fd00::/8"

        ${tailscale}

        # nat
        dns_table=${dns_table_name}
        dns_v6_table=${dns_v6_table_name}
        mark_table=${mark_table_name}
        mark_v6_table=${mark_v6_table_name}
        iptables -w -t nat -N "$dns_table"
        iptables -w -t nat -N "$mark_table"
        iptables -w -t nat -N "$dns_v6_table"
        iptables -w -t nat -N "$mark_v6_table"

        for p in tcp udp; do
          iptables -w -t nat -A PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_table"
          ip6tables -w -t nat -A PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_v6_table"
        done

        if [[ -n $fakeip ]]; then
          iptables -w -t nat -A PREROUTING -d "$fakeip" -p tcp -j "$mark_table"
        fi
        if (( daily_ports )); then
          iptables -w -t nat -A PREROUTING -p tcp -m multiport --dports 22,80,443,8080,8443 -j "$mark_table"
        else
          iptables -w -t nat -A PREROUTING -p tcp -m tcp -j "$mark_table"
        fi

        if [[ -n $fakeipV6 ]]; then
          ip6tables -w -t nat -A PREROUTING -d "$fakeipV6" -p tcp -j "$mark_v6_table"
        fi
        if (( daily_ports )); then
          ip6tables -w -t nat -A PREROUTING -p tcp -m tcp -j "$mark_v6_table"
        else
          ip6tables -w -t nat -A PREROUTING -p tcp -m tcp -j "$mark_v6_table"
        fi

        for p in tcp udp; do
          iptables -w -t nat -A "$mark_table" -p "$p" --dport 53 -j RETURN
        done
        iptables -w -t nat -A "$mark_table" -m --mark "$mark" -j RETURN

        for p in tcp udp; do
          ip6tables -w -t nat -A "$mark_v6_table" -p "$p" --dport 53 -j RETURN
        done
        ip6tables -w -t nat -A "$mark_v6_table" -m --mark "$mark" -j RETURN

        for ipv4 in $host_ipv4; do
          iptables -w -t nat -A "$mark_table" -d "$ipv4" -j RETURN
        done

        for ipv6 in $host_ipv6; do
          ip6tables -w -t nat -A "$mark_v6_table" -d "$ipv6" -j RETURN
        done

        reseved_subnets=("0.0.0.0/8" "10.0.0.0/8" "127.0.0.0/8" "100.64.0.0/10" "169.254.0.0/16" "172.16.0.0/12" "192.168.0.0/16" "224.0.0.0/4" "240.0.0.0/4")
        for subnet in "''${reseved_subnets[@]}"; do
          iptables -w -t nat -A "$mark_table" -d "$subnet" -j RETURN
        done

        reseved_subnets_v6=("fe80::/10" "fd00::/8" "::/128" "::1/128" "::ffff:0.0.0.0/96" "64:ff9b::/96" "100::/64" "2001::/32" "2001:20::/28" "2001:db8::/32" "2002::/16")
        for subnet in "''${reseved_subnets_v6[@]}"; do
          ip6tables -w -t nat -A "$mark_v6_table" -d "$subnet" -j RETURN
        done

        redir_port=${toString redirPort}

        for ipv4 in $host_ipv4; do
          iptables -w -t nat -A "$mark_table" -s "$ipv4" -j REDIRECT --to-ports "$redir_port"
        done

        for ipv6 in $host_ipv6; do
          ip6tables -w -t nat -A "$mark_v6_table" -s "$ipv6" -j REDIRECT --to-ports "$redir_port"
        done

        iptables -w -t nat -A "$dns_table" -m --mark "$mark" -j RETURN

        ip6tables -w -t nat -A "$dns_v6_table" -m --mark "$mark" -j RETURN

        dns_port=${toString dnsPort}

        for ipv4 in $host_ipv4; do
          for p in tcp udp; do
            iptables -w -t nat -A "$dns_table" -s "$ipv4" -p "$p" -j REDIRECT --to-ports "$dns_port"
          done
        done

        for ipv6 in $host_ipv6; do
          for p in tcp udp; do
            ip6tables -w -t nat -A "$dns_v6_table" -s "$ipv6" -p "$p" -j REDIRECT --to-ports "$dns_port"
          done
        done

        # filter
        for ipv4 in $host_ipv4; do
          iptables -w -t filter -A INPUT -s "$ipv4" -j ACCEPT
        done

        for p in tcp udp; do
          iptables -w -t filter -A INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done

        for ipv6 in $host_ipv6; do
          ip6tables -w -t filter -A INPUT -s "$ipv6" -j ACCEPT
        done

        for p in tcp udp; do
          ip6tables -w -t filter -A INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done
      '';
    redir_stop =
      {
        isTailscale ? false,
        fakeip ? "",
        fakeipV6 ? "",
        dailyPorts ? true,
      }:
      let
        tailscale =
          if isTailscale then
            ''
              # tailscale
              host_ipv4+=" 100.64.0.0/10"
              host_ipv6+=" fd7a:115c:a1e0::/48"
            ''
          else
            "";
        dns_table_name = "sing_box_dns";
        dns_v6_table_name = "sing_box_dns_v6";
        mark_table_name = "sing_box_mark";
        mark_v6_table_name = "sing_box_mark_v6";
      in
      ''
        ${host_ip}
        daily_ports=${toString (if dailyPorts then 1 else 0)}
        fakeip=${fakeip}
        fakeipV6=${fakeipV6}

        host_ipv4+=" 127.0.0.0/8"
        host_ipv6+=" fe80::/10 fd00::/8"

        ${tailscale}

        dns_table=${dns_table_name}
        dns_v6_table=${dns_v6_table_name}
        mark_table=${mark_table_name}
        mark_v6_table=${mark_v6_table_name}

        # nat
        for p in tcp udp; do
          iptables -w -t nat -D PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_table"
        done
        if [[ -n $fakeip ]]; then
          iptables -w -t nat -D PREROUTING -d "$fakeip" -p tcp -j "$mark_table"
        fi
        iptables -w -t nat -D PREROUTING -p tcp -m multiport --dports 22,80,443,8080,8443 -j "$mark_table"
        iptables -w -t nat -F "$dns_table"
        iptables -w -t nat -X "$dns_table"
        iptables -w -t nat -F "$mark_table"
        iptables -w -t nat -X "$mark_table"

        for p in tcp udp; do
          ip6tables -w -t nat -D PREROUTING -p "$p" -m "$p" --dport 53 -j "$dns_v6_table"
        done
        if [[ -n $fakeipV6 ]]; then
          ip6tables -w -t nat -D PREROUTING -d "$fakeipV6" -p tcp -j "$mark_v6_table"
        fi
        if (( daily_ports )); then
          ip6tables -w -t nat -D PREROUTING -p tcp -m multiport --dports 22,80,443,8080,8443 -j "$mark_v6_table"
        else
          ip6tables -w -t nat -D PREROUTING -p tcp -m tcp -j "$mark_v6_table"
        fi
        ip6tables -w -t nat -F "$dns_v6_table"
        ip6tables -w -t nat -X "$dns_v6_table"
        ip6tables -w -t nat -F "$mark_v6_table"
        ip6tables -w -t nat -X "$mark_v6_table"

        # filter
        for ipv4 in $host_ipv4; do
          iptables -w -t filter -D INPUT -s "$ipv4" -j ACCEPT
        done

        for p in tcp udp; do
          iptables -w -t filter -D INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done

        for ipv6 in $host_ipv6; do
          ip6tables -w -t filter -D INPUT -s "$ipv6" -j ACCEPT
        done

        for p in tcp udp; do
          ip6tables -w -t filter -D INPUT -p "$p" -m multiport --dports 7890,9999 -j reject --reject-with icmp-port-unreachable
        done
      '';
  };
}
