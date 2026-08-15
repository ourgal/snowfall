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
  port = 8222;
  name = getDirname _name;
  value = {
    sops.secrets."${name}/adminToken".owner = name;
    services = {
      vaultwarden = enabled // {
        config = {
          ROCKET_ADDRESS = "::1";
          ROCKET_PORT = port;
        };
        environmentFile = config.sops.secrets."${name}/adminToken".path;
      };
      borgmatic.settings.source_directories = [ "/var/lib/bitwarden_rs" ];
      caddy = mkCaddyProxy {
        domain = domains.${name};
        inherit port;
      };
    };
    ${namespace} = mkFireholRule {
      inherit name;
      tcp = port;
    };
    networking.firewall.allowedTCPPorts = [ port ];
  };
  _args = { inherit value args; };
in
nixosModule _args
