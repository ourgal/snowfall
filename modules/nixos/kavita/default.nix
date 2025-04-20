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
  port = 5000;
  name = getDirname _name;
  value = {
    sops.secrets."${name}/token".owner = name;

    services = {
      kavita = enabled // {
        settings = {
          Port = port;
        };
        tokenKeyFile = config.sops.secrets."${name}/token".path;
      };
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };

    systemd.services.kavita = {
      serviceConfig = {
        SupplementaryGroups = [ "syncthing" ];
      };
    };

    networking.firewall.allowedTCPPorts = [ port ];
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
