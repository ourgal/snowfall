args:
let
  inherit (args) namespace lib config;
  inherit (lib.${namespace}) nixosModule enabled;
  user = config.${namespace}.user.name;
  port = 27701;
  value = {
    services = {
      anki-sync-server = enabled // {
        inherit port;
        openFirewall = true;
        users = [
          {
            username = user;
            passwordFile = "/home/${user}/.config/anki-sync-server/password";
          }
        ];
      };
      caddy = enabled // {
        virtualHosts = {
          "http://anki.zxc.cn".extraConfig = ''
            reverse_proxy http://localhost:${toString port}
          '';
        };
      };
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
