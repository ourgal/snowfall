args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.firewall.allowedUDPPorts = [ 4010 ];
  };
  _args = { inherit value args; };
in
nixosModule _args
