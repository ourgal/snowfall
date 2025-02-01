args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 5000;
  value = {
    sops.secrets."kavita/token".owner = "kavita";

    services.kavita = enabled // {
      settings = {
        Port = port;
      };
      tokenKeyFile = config.sops.secrets."kavita/token".path;
    };

    systemd.services.kavita.serviceConfig = {
      SupplementaryGroups = [ "syncthing" ];
    };

    services.caddy = enabled // {
      virtualHosts =
        let
          inherit (config.${namespace}.user.duckdns) token domain;
        in
        {
          "http://${domains.kavita}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
          "kavita.${domain}.duckdns.org".extraConfig = ''
            tls {
                dns duckdns ${token}
            }
            reverse_proxy http://localhost:${toString port}
          '';
        };
    };
    networking.firewall.allowedTCPPorts = [ port ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
