{ ... }:
let
  mkRuleProvider = name: {
    tag = name;
    type = "http";
    behavior = "domain";
    format = "mrs";
    path = "./rules/${name}.mrs";
    url = "https://github.com/DustinWin/ruleset_geodata/releases/download/mihomo-ruleset/${name}.mrs";
    interval = 86400;
  };
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
    mkProxyGroup = name: filter: {
      inherit name filter;
      type = "url-test";
      tolerance = 100;
      lazy = true;
      include-all-providers = true;
    };
    RuleProviders = {
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
        tag = "geosite-cn";
        type = "http";
        behavior = "domain";
        format = "mrs";
        path = "./rules/geosite-cn.mrs";
        url = "https://fastly.jsdelivr.net/gh/juewuy/ShellCrash@master/bin/geodata/mrs_geosite_cn.mrs";
      };
    };
  };
}
