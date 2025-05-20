args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    domains
    enabled
    getDirname
    mkFireholRule
    mkCaddyProxy
    ;
  port = 9876;
  name = getDirname _name;
  value = {
    services = {
      pyload = enabled // {
        inherit port;
        listenAddress = "0.0.0.0";
      };
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

    systemd.services.pyload.serviceConfig.ProtectSystem = lib.mkForce "full";
  };
  _args = { inherit value args; };
in
nixosModule _args
