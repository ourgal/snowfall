args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.firewall.allowedTCPPorts = [ 8080 ];
  };
  _args = { inherit value args; };
in
nixosModule _args
