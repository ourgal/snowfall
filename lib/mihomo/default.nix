{ ... }:
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
    mkRuleProvider = name: {
      type = "http";
      behavior = "domain";
      format = "mrs";
      path = "./rules/${name}.mrs";
      url = "https://github.com/DustinWin/ruleset_geodata/releases/download/mihomo-ruleset/${name}.mrs";
      interval = 86400;
    };
    mkProxyGroup = name: filter: {
      inherit name filter;
      type = "url-test";
      tolerance = 100;
      lazy = true;
      include-all-providers = true;
    };
  };
}
