args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8096;
  value = {
    services = {
      jellyfin = enabled // {
        openFirewall = true;
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.jellyfin}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
    systemd.services.jellyfin.serviceConfig = {
      SupplementaryGroups = [ "syncthing" ];
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
