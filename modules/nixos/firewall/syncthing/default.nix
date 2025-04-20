args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  ports = [ 22000 ];
  value = {
    networking.firewall = {
      allowedTCPPorts = ports;
      allowedUDPPorts = ports;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
