args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.firewall.allowedTCPPorts = [ 24800 ];
  };
  _args = { inherit value args; };
in
nixosModule _args
