args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace})
    nixosModule
    enabled
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 4747;
  MusicFolder = "/var/lib/syncthing/music";
  name = getDirname path;
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
      caddy = mkCaddyProxy domains.${name} port;
    };

    systemd.tmpfiles.rules = [
      "d ${config.services.gonic.settings.podcast-path} 0770 ${name} ${name} - -"
      "d ${config.services.gonic.settings.playlists-path} 0770 ${name} ${name} - -"
    ];

    users.groups.${name} = { };

    users.users.${name} = {
      description = "Gonic Service User";
      home = "/var/lib/${name}";
      createHome = true;
      isSystemUser = true;
      group = name;
    };

    systemd.services.gonic.serviceConfig = {
      SupplementaryGroups = [ "syncthing" ];
    };

    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
