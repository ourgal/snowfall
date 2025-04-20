args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  peer-port-random-low = 65535;
  peer-port-random-high = 65535;
  rpc-port = 9091;
  peer-port = 51413;
  value = {
    networking.firewall = {
      allowedTCPPortRanges = [
        {
          from = peer-port-random-low;
          to = peer-port-random-high;
        }
      ];
      allowedUDPPortRanges = [
        {
          from = peer-port-random-low;
          to = peer-port-random-high;
        }
      ];
      allowedTCPPorts = [
        rpc-port
        peer-port
      ];
      allowedUDPPorts = [ peer-port ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
