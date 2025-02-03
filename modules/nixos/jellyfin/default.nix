args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8096;
  value = {
    services = {
      jellyfin = enabled // {
        openFirewall = true;
      };
      caddy = enabled // {
        virtualHosts =
          let
            inherit (config.${namespace}.user.duckdns) token domain;
          in
          {
            "http://${domains.jellyfin}".extraConfig = ''
              reverse_proxy http://localhost:${toString port}
            '';
            "jellyfin.${domain}.duckdns.org".extraConfig = ''
              tls {
                  dns duckdns ${token}
              }
              reverse_proxy http://localhost:${toString port}
            '';
          };
      };
    };

    systemd.services.jellyfin = {
      serviceConfig = {
        SupplementaryGroups = [
          "syncthing"
          "sonarr"
        ];
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
