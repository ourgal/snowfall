{ ... }@args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.systemPackages = with pkgs; [ godns ];
    systemd.services.godns = {
      description = "godns";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Type = "simple";
        ExecStart = ''${pkgs.godns}/bin/godns --c "/etc/godns/config.json"'';
        Restart = "always";
      };
    };
    environment.etc."godns/config.json".text = builtins.toJSON {
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
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
