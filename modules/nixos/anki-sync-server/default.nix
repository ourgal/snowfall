args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  user = config.${namespace}.user.name;
  port = 27701;
  name = "anki-sync-server";
  value = {
    sops.secrets."${name}/password".owner = user;
    services = {
      anki-sync-server = enabled // {
        inherit port;
        openFirewall = true;
        users = [
          {
            username = user;
            passwordFile = config.sops.secrets."${name}/password".path;
          }
        ];
      };
      borgmatic.settings.source_directories = [ "/var/lib/private/${name}" ];
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.anki}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
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
