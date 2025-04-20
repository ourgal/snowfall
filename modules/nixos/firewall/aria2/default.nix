args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  rpc = 6800;
  listenPortRange = [
    {
      from = 6881;
      to = 6999;
    }
  ];
  value = {
    networking.firewall = {
      allowedUDPPortRanges = listenPortRange;
      allowedTCPPorts = [ rpc ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
