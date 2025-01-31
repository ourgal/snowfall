args:
let
  inherit (args)
    namespace
    lib
    ;
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
        virtualHosts = {
          "http://${domains.navidrome}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
    systemd.services.navidrome.serviceConfig = {
      SupplementaryGroups = [ "syncthing" ];
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
