args:
let
  inherit (args)
    namespace
    lib
    pkgs
    config
    inputs
    ;
  inherit (lib.${namespace})
    nixosModule
    switch
    mkOpt'
    cfgNixos
    domainBlackList
    domainWhiteList
    ;
  inherit (lib) optional;
  utils = import "${inputs.nixpkgs}/nixos/lib/utils.nix" { inherit lib pkgs config; };
  cfg = cfgNixos config.${namespace} ./.;
  isTproxy = cfg.mode == "tproxy";
  isRedirect = cfg.mode == "redirect";
  isTun = cfg.mode == "tun";
  package = pkgs.sing-box;
  apiPort = 9999;
  tproxyPort = 7893;
  redirectPort = 7892;
  dnsPort = 1053;
  mixPort = 7890;
  routingMark = 255;
  fakeIpSubnet = "28.0.0.0/8";
  fakeIp6Subnet = "fc00::/16";
  configTemplate = {
    log = {
      level = "info";
      timestamp = true;
    };
    dns = {
      servers = [
        {
          type = "hosts";
          tag = "hosts";
          path = [
            "/root/.hosts"
            "/etc/hosts"
          ];
          predefined = {
            localhost = [
              "127.0.0.1"
              "::1"
            ];
            "time.android.com" = "203.107.6.88";
            "time.facebook.com" = "203.107.6.88";
          };
        }
        (
          {
            type = "https";
            tag = "dns_proxy";
            detour = "♻️ 自动选择";
            domain_resolver = "dns_resolver";
            server = "cloudflare-dns.com";
            server_port = 443;
          }
          // (if (isTproxy || isRedirect) then { routing_mark = routingMark; } else { })
        )
        (
          {
            type = "https";
            tag = "dns_direct";
            domain_resolver = "dns_resolver";
            server = "dns.alidns.com";
            server_port = 443;
          }
          // (if (isTproxy || isRedirect) then { routing_mark = routingMark; } else { })
        )
        (
          {
            type = "https";
            tag = "dns_direct";
            server = "114.114.114.114";
            path = "dns-query";
            server_port = 443;
          }
          // (if (isTproxy || isRedirect) then { routing_mark = routingMark; } else { })
        )
        {
          type = "fakeip";
          tag = "dns_fakeip";
          inet4_range = fakeIpSubnet;
          inet6_range = fakeIp6Subnet;
        }
        (
          {
            type = "https";
            tag = "dns_resolver";
            server = "223.5.5.5";
            server_port = 443;
          }
          // (if (isTproxy || isRedirect) then { routing_mark = routingMark; } else { })
        )
      ];
      rules = [
        {
          ip_accept_any = true;
          server = "hosts";
        }
        {
          clash_mode = "Direct";
          server = "dns_direct";
          strategy = "prefer_ipv4";
        }
        {
          domain_suffix = "services.googleapis.cn";
          server = "dns_fakeip";
          strategy = "prefer_ipv4";
          rewrite_ttl = 1;
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
          server = "dns_direct";
        }
        {
          domain_suffix = [
            "*"
            "lan"
            "localdomain"
            "example"
            "invalid"
            "localhost"
            "test"
            "local"
            "home.arpa"
            "direct"
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
            "kk-rays.com"
            "steamcontent.com"
            "srv.nintendo.net"
            "n.n.srv.nintendo.net"
            "cdn.nintendo.net"
            "battle.net"
            "battlenet.com.cn"
            "wotgame.cn"
            "wggames.cn"
            "wowsgame.cn"
            "wargaming.net"
            "linksys.com"
            "linksyssmartwifi.com"
            "router.asus.com"
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
            "pub.3gppnetwork.org"
            "oray.com"
            "orayimg.com"
            "gcloudcs.com"
            "gcloudsdk.com"
            "dynv6.net"
          ];
          server = "dns_direct";
        }
        {
          domain_regex = [
            "time\\..*\\.com"
            "time\\..*\\.gov"
            "time\\..*\\.edu\\.cn"
            "time\\..*\\.apple\\.com"
            "time1\\..*\\.com"
            "time2\\..*\\.com"
            "time3\\..*\\.com"
            "time4\\..*\\.com"
            "time5\\..*\\.com"
            "time6\\..*\\.com"
            "time7\\..*\\.com"
            "ntp\\..*\\.com"
            "ntp1\\..*\\.com"
            "ntp2\\..*\\.com"
            "ntp3\\..*\\.com"
            "ntp4\\..*\\.com"
            "ntp5\\..*\\.com"
            "ntp6\\..*\\.com"
            "ntp7\\..*\\.com"
            "localhost\\..*\\.weixin\\.qq\\.com"
            "xbox\\..*\\.*\\.microsoft\\.com"
            ".*\\.*\\.xboxlive\\.com"
            "xbox\\..*\\.microsoft\\.com"
            ".+\\.stun\\..*\\.*"
            ".+\\.stun\\..*\\.*\\.*"
            ".+\\.stun\\..*\\.*\\.*\\.*"
            ".+\\.stun\\..*\\.*\\.*\\.*\\.*"
          ];
          server = "dns_direct";
        }
        {
          query_type = [
            "A"
            "AAAA"
          ];
          clash_mode = "Global";
          server = "dns_fakeip";
          strategy = "prefer_ipv4";
          rewrite_ttl = 1;
        }
        {
          rule_set = "cn";
          server = "dns_direct";
        }
        {
          query_type = [
            "A"
            "AAAA"
          ];
          server = "dns_fakeip";
          strategy = "prefer_ipv4";
          rewrite_ttl = 1;
        }
      ];
      final = "dns_proxy";
      reverse_mapping = true;
      strategy = "prefer_ipv4";
    };
    certificate = {
      store = "mozilla";
    };
    inbounds = [
      {
        type = "mixed";
        tag = "mixed-in";
        listen = "::";
        listen_port = mixPort;
      }
    ]
    ++ (optional (isTproxy || isRedirect) {
      type = "direct";
      tag = "dns-in";
      listen = "::";
      listen_port = dnsPort;
    })
    ++ (optional isTproxy {
      type = "tproxy";
      tag = "tproxy-in";
      listen = "::";
      listen_port = tproxyPort;
    })
    ++ (optional isRedirect {
      type = "redirect";
      tag = "redirect-in";
      listen = "::";
      listen_port = redirectPort;
    })
    ++ (optional isTun {
      type = "tun";
      tag = "tun-in";
      address = [
        "172.18.0.1/30"
        "fdfe:dcba:9876::1/126"
      ];
      mtu = 9000;
      route_exclude_address = [
        "10.0.0.0/8"
        "100.64.0.0/10"
        "169.254.0.0/16"
        "172.16.0.0/12"
        "192.0.0.0/24"
        "192.168.0.0/16"
      ];
      auto_route = true;
      auto_redirect = true;
      strict_route = true;
      endpoint_independent_nat = false;
      exclude_package = [ "com.android.captiveportallogin" ];
    });
    endpoints =
      [ ]
      ++ optional cfg.tailscale.enable {
        type = "tailscale";
        tag = "ts-ep";
        hostname = "router";
        advertise_routes = [ "192.168.123.0/24" ];
      };
    outbounds = [
      {
        type = "direct";
        tag = "DIRECT";
      }
      {
        type = "block";
        tag = "REJECT";
      }
      {
        type = "selector";
        tag = "🚀 节点选择";
        outbounds = [
          "♻️ 自动选择"
          "✨ 自动选择（去高倍率）"
          "🛠️ 手动切换"
          "🎯 本地直连"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🛠️ 手动切换";
        outbounds = [ "{all}" ];
      }
      {
        type = "urltest";
        tag = "♻️ 自动选择";
        outbounds = [ "{all}" ];
        tolerance = 100;
      }
      {
        type = "urltest";
        tag = "✨ 自动选择（去高倍率）";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "exclude";
            keywords = [
              "剩余|重置|到期|防失联|官网|导航|客服|http|www|专线|专用|高级|直连|急速|高速|高倍率|游戏|铂金|钻石|企业|VIP|Ultra|Game|IEPL|IPLC|AIA|BGP|GIA|CN2|CMI|HGC|HKT|CTM|CC|AC|x([2-9]|[0-9][0-9]+)"
            ];
          }
        ];
      }
      {
        type = "selector";
        tag = "🤖 AI 平台";
        outbounds = [
          "🚀 节点选择"
          "🤖 AI节点（过滤港澳）"
          "🎯 本地直连"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "urltest";
        tag = "🤖 AI节点（过滤港澳）";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "exclude";
            keywords = [ "剩余|重置|到期|防失联|官网|导航|客服|http|www|🇭🇰|港|🇲🇴|澳门|hk|hongkong|hong kong" ];
          }
        ];
      }
      {
        type = "selector";
        tag = "🎬 奈飞视频";
        outbounds = [
          "🚀 节点选择"
          "🎬 奈飞节点"
          "🎯 本地直连"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "urltest";
        tag = "🎬 奈飞节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "NF|奈飞|解锁|Netflix|NETFLIX|Media" ];
          }
        ];
      }
      {
        type = "selector";
        tag = "▶️ 油管视频";
        outbounds = [
          "🚀 节点选择"
          "🎯 本地直连"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "📢 谷歌推送";
        outbounds = [
          "🚀 节点选择"
          "🎯 本地直连"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "📲 电报消息";
        outbounds = [
          "🚀 节点选择"
          "🎯 本地直连"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🌍 国际媒体";
        outbounds = [
          "🚀 节点选择"
          "🎯 本地直连"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🌐 国际流量";
        outbounds = [
          "🚀 节点选择"
          "🎯 本地直连"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🕹 国服游戏";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
        ];
      }
      {
        type = "selector";
        tag = "🦾 Steam平台";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🪟 微软服务";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🍎 苹果服务";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🇬 谷歌服务";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🧲 BT下载";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "📈 网络测速";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "↔️ 直连软件";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
        ];
      }
      {
        type = "selector";
        tag = "🀄️ 国内流量";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
        ];
      }
      {
        type = "selector";
        tag = "🐟 漏网之鱼";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
          "♻️ 自动选择"
          "🛠️ 手动切换"
          "🇭🇰 香港节点"
          "🇹🇼 台湾节点"
          "🇺🇸 美国节点"
          "🇯🇵 日本节点"
          "🇪🇺 欧洲节点"
          "🇰🇷 韩国节点"
          "🇸🇬 狮城节点"
          "👑 高级节点"
          "📉 省流节点"
        ];
      }
      {
        type = "selector";
        tag = "🛑 广告拦截";
        outbounds = [
          "⛔ 禁止连接"
          "🎯 本地直连"
        ];
      }
      {
        type = "block";
        tag = "⛔ 禁止连接";
      }
      {
        type = "direct";
        tag = "🎯 本地直连";
      }
      {
        type = "selector";
        tag = "GLOBAL";
        outbounds = [
          "🎯 本地直连"
          "🚀 节点选择"
        ];
      }
      {
        type = "urltest";
        tag = "🇭🇰 香港节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇭🇰|港|hk|hongkong|hong kong" ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "🇹🇼 台湾节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇹🇼|台|tw|taiwan|tai wan" ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "🇺🇸 美国节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇺🇸|美|us|unitedstates|united states" ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "🇯🇵 日本节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇯🇵|日|jp|japan" ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "🇪🇺 欧洲节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [
              "🇪🇺|欧|德|英|法|荷|俄罗斯|西班牙|意大利|瑞士|瑞典|土耳其|挪威|芬兰|丹麦|比利时|爱尔兰|奥地利|波兰|葡萄牙|乌克兰|希腊|捷克|匈牙利|罗马尼亚|保加利亚|冰岛|克罗地亚"
            ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "🇰🇷 韩国节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇰🇷|韩|韓|首尔|kr|kor" ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "🇸🇬 狮城节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "🇸🇬|新|sg|singapore" ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "👑 高级节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "专线|专用|高级|直连|急速|高倍率|游戏|game|IEPL|IPLC|AIA|CTM|CC|AC" ];
          }
        ];
      }
      {
        type = "urltest";
        tag = "📉 省流节点";
        outbounds = [ "{all}" ];
        filter = [
          {
            action = "include";
            keywords = [ "0\\.[1-5]|低倍率|省流|大流量" ];
          }
        ];
        tolerance = 100;
      }
    ];
    route = (
      {
        rules =
          (optional cfg.tailscale.enable {
            inbound = "ts-ep";
            port = 53;
            action = "hijack-dns";
          })
          ++ [
            {
              inbound = "dns-in";
              action = "hijack-dns";
            }
            {
              action = "sniff";
              timeout = "500ms";
            }
          ]
          ++ (optional cfg.tailscale.enable {
            ip_cidr = [
              "100.64.0.0/10"
              "fd7a:115c:a1e0::/48"
            ];
            outbound = "ts-ep";
          })
          ++ [
            {
              type = "logical";
              mode = "or";
              rules = [
                { port = 853; }
                { network = "quic"; }
              ];
              action = "reject";
            }
            (
              {
                type = "logical";
                mode = "or";
                rules = [
                  { network = "icmp"; }
                  { ip_is_private = true; }
                  { protocol = "bittorrent"; }
                ];
              }
              // (if isTun then { action = "bypass"; } else { outbound = "DIRECT"; })
            )
            {
              clash_mode = "Direct";
              outbound = "DIRECT";
            }
            {
              clash_mode = "Global";
              outbound = "GLOBAL";
            }
            {
              domain_suffix = "captive.apple.com";
              outbound = "DIRECT";
            }
            {
              domain_suffix = "kamo.teracloud.jp";
              outbound = "DIRECT";
            }
            {
              domain_suffix = domainWhiteList;
              outbound = "DIRECT";
            }
            {
              domain_suffix = domainBlackList;
              outbound = "🚀 节点选择";
            }
            {
              rule_set = "private";
              outbound = "🎯 本地直连";
            }
            {
              rule_set = "ads";
              outbound = "🛑 广告拦截";
            }
            {
              rule_set = "networktest";
              outbound = "📈 网络测速";
            }
            {
              rule_set = "applications";
              outbound = "↔️ 直连软件";
            }
            {
              rule_set = "trackerslist";
              outbound = "🧲 BT下载";
            }
            {
              rule_set = "apple-cn";
              outbound = "🍎 苹果服务";
            }
            {
              rule_set = "microsoft-cn";
              outbound = "🪟 微软服务";
            }
            {
              rule_set = "google-cn";
              outbound = "🇬 谷歌服务";
            }
            {
              rule_set = "steamcn";
              outbound = "🦾 Steam平台";
            }
            {
              rule_set = "games-cn";
              outbound = "🕹 国服游戏";
            }
            {
              rule_set = "googlefcm";
              outbound = "📢 谷歌推送";
            }
            {
              rule_set = "netflix";
              outbound = "🎬 奈飞视频";
            }
            {
              rule_set = "youtube";
              outbound = "▶️ 油管视频";
            }
            {
              rule_set = "ai";
              outbound = "🤖 AI 平台";
            }
            {
              rule_set = "media";
              outbound = "🌍 国际媒体";
            }
            {
              rule_set = "proxy";
              outbound = "🌐 国际流量";
            }
            {
              rule_set = "cn";
              outbound = "🀄️ 国内流量";
            }
            {
              rule_set = "privateip";
              outbound = "🎯 本地直连";
            }
            {
              rule_set = "telegramip";
              outbound = "📲 电报消息";
            }
            {
              action = "resolve";
              server = "dns_proxy";
              strategy = "prefer_ipv4";
            }
            {
              rule_set = "mediaip";
              outbound = "🌍 国际媒体";
            }
            {
              rule_set = "cnip";
              outbound = "🀄️ 国内流量";
            }
          ];
        rule_set = [
          {
            type = "remote";
            tag = "private";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/private.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "ads";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/ads.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "networktest";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/networktest.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "applications";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/applications.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "trackerslist";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/trackerslist.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "apple-cn";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/apple-cn.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "microsoft-cn";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/microsoft-cn.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "google-cn";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/google-cn.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "steamcn";
            url = "https://testingcf.jsdelivr.net/gh/MetaCubeX/meta-rules-dat@refs/heads/sing/geo/geosite/steam%40cn.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "games-cn";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/games-cn.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "googlefcm";
            url = "https://testingcf.jsdelivr.net/gh/MetaCubeX/meta-rules-dat@refs/heads/sing/geo/geosite/googlefcm.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "netflix";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/netflix.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "youtube";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/youtube.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "ai";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/ai.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "media";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/media.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "games";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/games.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "proxy";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/proxy.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "cn";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/cn.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "privateip";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/privateip.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "telegramip";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/telegramip.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "mediaip";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/mediaip.srs";
            download_detour = "DIRECT";
          }
          {
            type = "remote";
            tag = "cnip";
            url = "https://testingcf.jsdelivr.net/gh/DustinWin/ruleset_geodata@refs/heads/sing-box-ruleset/cnip.srs";
            download_detour = "DIRECT";
          }
        ];
        final = "🐟 漏网之鱼";
        default_domain_resolver = "dns_resolver";
      }
      // (if (isTproxy || isRedirect) then { default_mark = routingMark; } else { })
    );
    experimental = {
      clash_api = {
        external_controller = "0.0.0.0:${toString apiPort}";
        external_ui = pkgs.metacubexd;
        external_ui_download_url = "https://github.com/Zephyruso/zashboard/releases/latest/download/dist-cdn-fonts.zip";
        default_mode = "Rule";
      };
    };
  };
  value = {
    networking = {
      firewall =
        if (isTproxy || isRedirect) then
          let
            p = [
              dnsPort
              apiPort
              mixPort
              53
            ]
            ++ optional isTproxy tproxyPort
            ++ optional isRedirect redirectPort;
          in
          {
            allowedTCPPorts = p;
            allowedUDPPorts = p;
          }
        else
          { enable = false; };
    };
    # for polkit rules
    environment.systemPackages = [ package ];
    services.dbus.packages = [ package ];
    systemd.packages = [ package ];

    systemd.services.sing-box =
      let
        firewallStart = pkgs.writeShellScript "singboxFirewallStart" (
          if isTproxy then
            lib.${namespace}.sing-box.tproxy_start {
              isTailscale = cfg.tailscale.enable;
              firewall_mark = 1;
              tproxyPort = tproxyPort;
              dnsPort = dnsPort;
              mark = routingMark;
              fakeip = fakeIpSubnet;
              fakeipV6 = fakeIp6Subnet;
            }
          else if isRedirect then
            lib.${namespace}.sing-box.redir_start {
              isTailscale = cfg.tailscale.enable;
              firewall_mark = 1;
              redirPort = redirectPort;
              dnsPort = dnsPort;
              mark = routingMark;
              fakeip = fakeIpSubnet;
              fakeipV6 = fakeIp6Subnet;
            }
          else
            ""
        );
        firewallStop = pkgs.writeShellScript "singboxFirewallStop" (
          if isTproxy then
            lib.${namespace}.sing-box.tproxy_stop {
              isTailscale = cfg.tailscale.enable;
              firewall_mark = 1;
              fakeip = fakeIpSubnet;
              fakeipV6 = fakeIp6Subnet;
            }
          else if isRedirect then
            lib.${namespace}.sing-box.redir_stop {
              isTailscale = cfg.tailscale.enable;
              firewall_mark = 1;
              redirPort = redirectPort;
              dnsPort = dnsPort;
              mark = routingMark;
              fakeip = fakeIpSubnet;
              fakeipV6 = fakeIp6Subnet;
            }
          else
            ""
        );
      in
      {
        path = with pkgs; [
          iptables
          iproute2
          gawk
        ];
        serviceConfig = {
          User = "sing-box";
          Group = "sing-box";

          StateDirectory = "sing-box";
          StateDirectoryMode = "0700";
          RuntimeDirectory = "sing-box";
          RuntimeDirectoryMode = "0700";
          WorkingDirectory = "/var/lib/sing-box";
          ExecStartPre =
            let
              script = pkgs.writeShellScript "sing-box-pre-start" ''
                ${utils.genJqSecretsReplacementSnippet configTemplate "/run/sing-box/template"}
                ${
                  lib.getExe pkgs.${namespace}.sing-box-subscribe-cli
                } --template /run/sing-box/template --out /run/sing-box/config.json $(cat ${
                  config.sops.secrets."subs/nano".path
                })
                chown --reference=/run/sing-box /run/sing-box/config.json
              '';
            in
            if (isTproxy || isRedirect) then
              [
                firewallStart
                script
              ]
            else
              [ script ];
          ExecStart = [
            ""
            "${lib.getExe package} -D \${STATE_DIRECTORY} -C \${RUNTIME_DIRECTORY} run"
          ];
          ExecStop = if (isTproxy || isRedirect) then [ firewallStop ] else [ ];
        };
        # After= is specified by upstream
        requires = [ "network-online.target" ];
        wantedBy = [ "multi-user.target" ];
      };

    users = {
      users.sing-box = {
        isSystemUser = true;
        group = "sing-box";
        home = "/var/lib/sing-box";
      };
      groups.sing-box = { };
    };
    ${namespace}.user.ports = [
      apiPort
      dnsPort
      mixPort
    ]
    ++ optional isTproxy tproxyPort
    ++ optional isRedirect redirectPort;
  };
  extraOpts = {
    mode = mkOpt' (lib.types.enum [
      "tproxy"
      "redirect"
      "tun"
    ]) "tproxy";
    tailscale = switch;
  };
  _args = { inherit value args extraOpts; };
in
nixosModule _args
