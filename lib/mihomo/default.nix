{ lib, namespace, ... }:
let
  inherit (builtins) attrNames map foldl';
  mkRuleProvider = name: type: {
    tag = name;
    type = "http";
    behavior = type;
    format = "mrs";
    proxy = "DIRECT";
    path = "./rules/${name}.mrs";
    url = "https://fastly.jsdelivr.net/gh/DustinWin/ruleset_geodata@mihomo-ruleset/${name}.mrs";
    interval = 86400;
  };
  mkProxyGroup = name: filter: {
    inherit name filter;
    type = "url-test";
    tolerance = 100;
    lazy = true;
    include-all-providers = true;
  };
  mkSubProxyGroup =
    name: type:
    {
      inherit name type;
      lazy = true;
      use = [ name ];
      proxy = "DIRECT";
    }
    // lib.optionalAttrs (type == "url-test") { tolerance = 100; };
in
{
  mihomo = {
    mkProxyProvider = name: url: hour: {
      type = "http";
      inherit url;
      path = "./providers/${name}.yaml";
      interval = 3600 * hour;
      health-check = {
        enable = true;
        lazy = true;
        url = "https://www.gstatic.com/generate_204";
        interval = 600;
      };
      override = {
        udp = true;
        skip-cert-verify = true;
      };
    };
    RuleProviders =
      let
        go = type: foldl' (acc: v: acc // { ${v} = mkRuleProvider v type; }) { };
      in
      (go "domain" [
        "private"
        "trackerslist"
        "microsoft-cn"
        "apple-cn"
        "google-cn"
        "games-cn"
        "ai"
        "proxy"
        "tld-cn"
        "cn"
      ])
      // (go "ipcidr" [
        "privateip"
        "telegramip"
      ]);
    proxyGroups =
      let
        subs = map (v: mkSubProxyGroup v "url-test") subsTags;
        subsTags = [
          "knjc"
          "nano"
        ];
        freeSubsTags = attrNames lib.${namespace}.freeSubs;
        freeSubs = map (v: mkSubProxyGroup v "select") freeSubsTags;
      in
      rec {
        expensive = mkProxyGroup "👑 高级节点" "(?i)(专线|专用|高级|直连|急速|高倍率|游戏|game|IEPL|IPLC|AIA|CTM|CC|AC)";
        cheap = mkProxyGroup "📉 省流节点" "(0.[1-5]|低倍率|省流|大流量)";
        HK = mkProxyGroup "🇭🇰 香港节点" "(?i)(🇭🇰|港|hk|hongkong|hong kong)";
        TW = mkProxyGroup "🇹🇼 台湾节点" "(?i)(🇹🇼|台|tw|taiwan|tai wan)";
        JP = mkProxyGroup "🇯🇵 日本节点" "(?i)(🇯🇵|日|jp|japan)";
        SG = mkProxyGroup "🇸🇬 新加坡节点" "(?i)(🇸🇬|新|sg|singapore)";
        US = mkProxyGroup "🇺🇸 美国节点" "(?i)(🇺🇸|美|us|unitedstates|united states)";
        countries = [
          HK
          TW
          JP
          SG
          US
        ];
        price = [
          expensive
          cheap
        ];
        countriesTags = map (v: v.name) countries;
        priceTags = map (v: v.name) price;
        inherit subs freeSubs;
        main = {
          name = "🚀 节点选择";
          type = "select";
          proxies = subsTags ++ freeSubsTags ++ countriesTags ++ priceTags ++ directTag;
        };
        mainTag = [ main.name ];
        ai = {
          name = "🤖 人工智能";
          type = "select";
          proxies = mainTag ++ countriesTags;
        };
        trackerslist = {
          name = "📥 Trackerslist";
          type = "select";
          proxies = directTag ++ mainTag;
        };
        game = {
          name = "🎮 游戏服务";
          type = "select";
          proxies = directTag ++ priceTags ++ mainTag;
        };
        microsoft = {
          name = "🪟 微软服务";
          type = "select";
          proxies = directTag ++ mainTag;
        };
        google = {
          name = "🇬 谷歌服务";
          type = "select";
          proxies = directTag ++ mainTag;
        };
        apple = {
          name = "🍎 苹果服务";
          type = "select";
          proxies = directTag ++ mainTag;
        };
        private = {
          name = "🛡️ 直连域名";
          type = "select";
          proxies = directTag ++ mainTag;
        };
        privateip = {
          name = "🀄️ 直连 IP";
          type = "select";
          proxies = directTag ++ mainTag;
        };
        proxy = {
          name = "🧱 代理域名";
          type = "select";
          proxies = mainTag ++ directTag;
        };
        telegram = {
          name = "📲 电报消息";
          type = "select";
          proxies = mainTag ++ countriesTags ++ subsTags ++ freeSubsTags;
        };
        final = {
          name = "🐟 漏网之鱼";
          type = "select";
          proxies = directTag ++ mainTag ++ countriesTags ++ priceTags ++ subsTags ++ freeSubsTags;
        };
        direct = {
          name = "🎯 全球直连";
          type = "select";
          proxies = [ "DIRECT" ];
        };
        directTag = [ direct.name ];
      };
  };
}
