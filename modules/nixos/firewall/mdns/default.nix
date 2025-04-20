args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.firewall.allowedUDPPorts = [ 5353 ];
  };
  _args = { inherit value args; };
in
nixosModule _args
