args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled domains;
  port = 8989;
  name = "sonarr";
  value = {
    services = {
      sonarr = enabled // {
        openFirewall = true;
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.sonarr}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
    systemd.services.sonarr.serviceConfig = {
      SupplementaryGroups = [ "transmission" ];
    };
    systemd.tmpfiles.rules = [ "d /mnt/anime 2770 sonarr sonarr - -" ];
    ${namespace} = {
      user.ports = [ port ];
      firehol.services = [
        {
          inherit name;
          tcp = port;
        }
      ];
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
