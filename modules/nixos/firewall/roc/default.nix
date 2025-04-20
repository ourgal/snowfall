args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  ports = [
    10001
    10002
  ];
  value = {
    networking.firewall = {
      allowedTCPPorts = ports;
      allowedUDPPorts = ports;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
