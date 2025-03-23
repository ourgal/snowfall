args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 4747;
  MusicFolder = "/var/lib/syncthing/music";
  value = {
    services = {
      gonic = enabled // {
        settings = {
          cache-path = "/var/cache/gonic";
          listen-addr = "127.0.0.1:${toString port}";
          music-path = [ MusicFolder ];
          podcast-path = "/var/lib/private/gonic/podcast";
          playlists-path = "/var/lib/private/gonic/playlists";
        };
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.gonic}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };

    systemd.tmpfiles.rules = [
      "d ${config.services.gonic.settings.podcast-path} 0770 gonic gonic - -"
      "d ${config.services.gonic.settings.playlists-path} 0770 gonic gonic - -"
    ];

    users.groups.gonic = { };

    users.users.gonic = {
      description = "Gonic Service User";
      home = "/var/lib/gonic";
      createHome = true;
      isSystemUser = true;
      group = "gonic";
    };

    systemd.services.gonic.serviceConfig = {
      SupplementaryGroups = [ "syncthing" ];
    };

    ${namespace}.user.ports = [ port ];
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
