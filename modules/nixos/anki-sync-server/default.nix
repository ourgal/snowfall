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
  user = config.${namespace}.user.name;
  port = 27701;
  name = getDirname path;
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
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
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
