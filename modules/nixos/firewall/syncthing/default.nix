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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
