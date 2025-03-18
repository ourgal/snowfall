args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 4533;
  MusicFolder = "/var/lib/syncthing/music";
  value = {
    services = {
      navidrome = enabled // {
        openFirewall = true;
        settings = {
          inherit MusicFolder;
          Port = port;
        };
      };
      caddy = enabled // {
        virtualHosts =
          let
            inherit (config.${namespace}.user.duckdns) token domain;
          in
          {
            "http://${domains.navidrome}".extraConfig = ''
              reverse_proxy http://localhost:${toString port}
            '';
            "navidrome.${domain}.duckdns.org".extraConfig = ''
              tls {
                  dns duckdns ${token}
              }
              reverse_proxy http://localhost:${toString port}
            '';
          };
      };
    };
    systemd.services.navidrome.serviceConfig = {
      SupplementaryGroups = [ "syncthing" ];
    };
    ${namespace}.user.ports = [ port ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
