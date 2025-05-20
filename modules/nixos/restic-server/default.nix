args:
let
  inherit (args) namespace lib _name;
  inherit (lib.${namespace})
    nixosModule
    enabled
    getDirname
    mkFireholRule
    ;
  port = 3457;
  name = getDirname _name;
  value = {
    services = {
      restic.server = enabled // {
        listenAddress = toString port;
        extraFlags = [ "--no-auth" ];
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
