{ ... }:
let
  outbounds =
    let
      mkOutbound = tag: includes: {
        type = "urltest";
        use_all_providers = true;
        tolerance = 100;
        inherit tag includes;
      };
      mkOutboundSub = tag: {
        type = "urltest";
        providers = tag;
        includes = ".*";
        tolerance = 100;
        inherit tag;
      };
      HK = mkOutbound "🇭🇰 香港节点" "港|HK|Hong Kong";
      TW = mkOutbound "🇹🇼 台湾节点" "台|新北|彰化|TW|Taiwan";
      JP = mkOutbound "🇯🇵 日本节点" "日本|川日|东京|大阪|泉日|埼玉|沪日|深日|[^-]日|JP|Japan";
      KR = mkOutbound "🇰🇷 韩国节点" "KR|Korea|KOR|首尔|韩|韓";
      SG = mkOutbound "🇸🇬 新加坡节点" "新加坡|坡|狮城|SG|Singapore";
      US = mkOutbound "🇺🇸 美国节点" "美|波特兰|达拉斯|俄勒冈|凤凰城|费利蒙|硅谷|拉斯维加斯|洛杉矶|圣何塞|圣克拉拉|西雅图|芝加哥|US|United States";
      countriesTags = [
        HK.tag
        TW.tag
        JP.tag
        KR.tag
        SG.tag
        US.tag
      ];
      nano = mkOutboundSub "nano";
      knjc = mkOutboundSub "knjc";
      subsTags = [
        nano.tag
        knjc.tag
      ];
      cheap = mkOutbound "📺 省流节点" "0.[1-5]|低倍率|省流|大流量";
      expensive = mkOutbound "👍 高级节点" "专线|专用|高级|直连|急速|高倍率|游戏|game|Game|GAME|IEPL|IPLC|AIA|CTM|CC|iepl|iplc|aia|ctm|cc|AC";
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
      games = {
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
        outbounds = [ direct.tag ] ++ countriesTags ++ subsTags ++ [ manual.tag ];
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
    games
    microsoft
    google
    apple
    networktest
    netflix
    ad
    global
    direct
    block
    dns
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
        url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@sing-box-ruleset/${tag}.srs";
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
      netflix = go "netflix";
      netflix_ip = go "netflixip";
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
    ];
    mkProvider = tag: url: time: {
      type = "remote";
      download_ua = "clash.meta";
      download_interval = "${toString time}h0m0s";
      healthcheck_url = "https://www.gstatic.com/generate_204";
      healthcheck_interval = "10m0s";
      download_detour = outbounds.direct.tag;
      inherit tag;
      path = "./providers/${tag}.yaml";
      download_url = url;
    };
  };
}
