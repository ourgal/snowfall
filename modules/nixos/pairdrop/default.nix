args:
let
  inherit (args)
    namespace
    lib
    pkgs
    _name
    ;
  inherit (lib.${namespace})
    nixosModule
    domains
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 3000;
  name = getDirname _name;
  value = {
    systemd.services.pairdrop = {
      description = "Pairdrop service";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];
      serviceConfig = {
        Restart = "on-failure";
        ExecStart = lib.getExe pkgs.pairdrop;
      };
      environment = {
        PORT = toString port;
      };
    };
    services.caddy = mkCaddyProxy {
      domain = domains.${name};
      inherit port;
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
