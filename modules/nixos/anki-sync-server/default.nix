args:
let
  inherit (args)
    namespace
    lib
    config
    _name
    ;
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
  name = getDirname _name;
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
        port = port;
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
