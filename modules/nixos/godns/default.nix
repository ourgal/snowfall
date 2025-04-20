args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  configFile = pkgs.writeText "godnsConfigFile" builtins.toJSON {
    provider = "DuckDNS";
    password = "";
    login_token = "${lib.strings.fileContents ./token.key}";
    domains = [
      {
        domain_name = "www.duckdns.org";
        sub_domains = [ "${lib.strings.fileContents ./domain.key}" ];
      }
    ];
    resolver = "8.8.8.8";
    ip_urls = [ "https://api.ip.sb/ip" ];
    ip_type = "IPv6";
    interval = 300;
    socks5_proxy = "";
  };
  value = {
    environment.systemPackages = [ pkgs.godns ];
    systemd.services.godns = {
      description = "godns";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = ''${pkgs.godns}/bin/godns --c "${configFile}"'';
        Restart = "always";
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
