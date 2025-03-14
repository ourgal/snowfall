{ ... }:
let
  outbounds =
    let
      HK = {
        type = "urltest";
        tag = "🇭🇰 香港节点";
        use_all_providers = true;
        includes = "港|HK|Hong Kong";
        tolerance = 100;
      };
      TW = {
        type = "urltest";
        tag = "🇹🇼 台湾节点";
        use_all_providers = true;
        includes = "台|新北|彰化|TW|Taiwan";
        tolerance = 100;
      };
      JP = {
        type = "urltest";
        tag = "🇯🇵 日本节点";
        use_all_providers = true;
        includes = "日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan";
        tolerance = 100;
      };
      KR = {
        type = "urltest";
        tag = "🇰🇷 韩国节点";
        use_all_providers = true;
        includes = "KR|Korea|KOR|首尔|韩|韓";
        tolerance = 100;
      };
      SG = {
        type = "urltest";
        tag = "🇸🇬 新加坡节点";
        use_all_providers = true;
        includes = "新加坡|坡|狮城|SG|Singapore";
        tolerance = 100;
      };
      US = {
        type = "urltest";
        tag = "🇺🇸 美国节点";
        use_all_providers = true;
        includes = "美|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|US|United States";
        tolerance = 100;
      };
      countriesTags = [
        HK.tag
        TW.tag
        JP.tag
        KR.tag
        SG.tag
        US.tag
      ];
      nano = {
        type = "urltest";
        tag = "nano";
        providers = "nano";
        includes = ".*";
        tolerance = 100;
      };
      knjc = {
        type = "urltest";
        tag = "knjc";
        providers = "knjc";
        includes = ".*";
        tolerance = 100;
      };
      subsTag = [
        nano.tag
        knjc.tag
      ];
      cheap = {
        type = "urltest";
        tag = "📺 省流节点";
        use_all_providers = true;
        includes = "0.[1-5]|低倍率|省流|大流量";
        tolerance = 100;
      };
      expensive = {
        type = "urltest";
        tag = "👍 高级节点";
        use_all_providers = true;
        includes = "专线|专用|高级|直连|急速|高倍率|游戏|game|Game|GAME|IEPL|IPLC|AIA|CTM|CC|iepl|iplc|aia|ctm|cc|AC";
        tolerance = 100;
      };
      priceTags = [
        cheap.tag
        expensive.tag
      ];
    in
    rec {
      inherit
        cheap
        expensive
        HK
        TW
        JP
        KR
        SG
        US
        nano
        knjc
        ;
      main = {
        type = "selector";
        tag = "🚀 节点选择";
        outbounds =
          subsTag
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
        outbounds = [ direct.tag ] ++ subsTag ++ countriesTags ++ priceTags ++ [ manual.tag ];
      };
      foreign = {
        type = "selector";
        tag = "🎯 全球直连";
        outbounds = [
          direct.tag
          main.tag
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
      game = {
        type = "selector";
        tag = "🎮 游戏平台";
        outbounds = [
          direct.tag
          main.tag
        ];
      };
      microsoft = {
        type = "selector";
        tag = "🪟 微软服务";
        outbounds = [
          direct.tag
          main.tag
        ];
      };
      google = {
        type = "selector";
        tag = "🇬 谷歌服务";
        outbounds = [
          direct.tag
          main.tag
        ];
      };
      apple = {
        type = "selector";
        tag = "🍎 苹果服务";
        outbounds = [
          direct.tag
          main.tag
        ];
      };
      networktest = {
        type = "selector";
        tag = "📈 网络测试";
        outbounds = [ direct.tag ] ++ countriesTags ++ subsTag ++ [ manual.tag ];
      };
      netflix = {
        type = "selector";
        tag = "🎥 奈飞解锁";
        outbounds = [
          expensive.tag
          main.tag
        ];
      };
      global = {
        type = "selector";
        tag = "GLOBAL";
        outbounds = [ direct.tag ] ++ countriesTags ++ subsTag ++ [ manual.tag ];
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
        outbounds = [
          direct.tag
          block.tag
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
  outboundsSorted = with outbounds; [
    main
    final
    nano
    knjc
    manual
    HK
    TW
    JP
    KR
    SG
    US
    cheap
    expensive
    foreign
    telegram
    ai
    game
    microsoft
    google
    apple
    networktest
    netflix
    ad
    global
    direct
    block
    outbounds.dns
  ];
  dnsServers = rec {
    direct = {
      tag = "dns_direct";
      address = "https://223.5.5.5/dns-query";
      address_resolver = resolver.tag;
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
  ruleSet = {
    private = {
      type = "remote";
      tag = "private";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/private.srs";
      download_detour = outbounds.direct.tag;
    };
    ai = {
      type = "remote";
      tag = "ai";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/ai.srs";
      download_detour = outbounds.direct.tag;
    };
    microsoft = {
      type = "remote";
      tag = "microsoft-cn";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/microsoft-cn.srs";
      download_detour = outbounds.direct.tag;
    };
    apple = {
      type = "remote";
      tag = "apple-cn";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/apple-cn.srs";
      download_detour = outbounds.direct.tag;
    };
    google = {
      type = "remote";
      tag = "google-cn";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/google-cn.srs";
      download_detour = outbounds.direct.tag;
    };
    games = {
      type = "remote";
      tag = "games-cn";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/games-cn.srs";
      download_detour = outbounds.direct.tag;
    };
    networktest = {
      type = "remote";
      tag = "networktest";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/networktest.srs";
      download_detour = outbounds.direct.tag;
    };
    proxy = {
      type = "remote";
      tag = "proxy";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/proxy.srs";
      download_detour = outbounds.direct.tag;
    };
    cn = {
      type = "remote";
      tag = "cn";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/cn.srs";
      download_detour = outbounds.direct.tag;
    };
    telegram_ip = {
      type = "remote";
      tag = "telegramip";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/telegramip.srs";
      download_detour = outbounds.direct.tag;
    };
    cn_ip = {
      type = "remote";
      tag = "cnip";
      format = "binary";
      url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/cnip.srs";
      download_detour = outbounds.direct.tag;
    };
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
        rule_set = "private";
        outbound = outbounds.foreign.tag;
      }
      {
        rule_set = "ai";
        outbound = outbounds.ai.tag;
      }
      {
        rule_set = "microsoft-cn";
        outbound = outbounds.microsoft.tag;
      }
      {
        rule_set = "apple-cn";
        outbound = outbounds.apple.tag;
      }
      {
        rule_set = "google-cn";
        outbound = outbounds.google.tag;
      }
      {
        rule_set = "games-cn";
        outbound = outbounds.game.tag;
      }
      {
        rule_set = "networktest";
        outbound = outbounds.networktest.tag;
      }
      {
        rule_set = "proxy";
        outbound = outbounds.main.tag;
      }
      {
        rule_set = "cn";
        outbound = outbounds.direct.tag;
      }
      {
        rule_set = "telegramip";
        outbound = outbounds.telegram.tag;
      }
      {
        rule_set = "cnip";
        outbound = outbounds.direct.tag;
      }
    ];
  };
}
