args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled domains;
  user = config.${namespace}.user.name;
  port = 27701;
  value = {
    sops.secrets."anki-sync-server/password".owner = user;
    services = {
      anki-sync-server = enabled // {
        inherit port;
        openFirewall = true;
        users = [
          {
            username = user;
            passwordFile = config.sops.secrets."anki-sync-server/password".path;
          }
        ];
      };
      caddy = enabled // {
        virtualHosts = {
          "http://${domains.anki}".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
