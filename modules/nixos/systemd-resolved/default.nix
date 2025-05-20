args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.resolved = enabled // {
      fallbackDns = [ ];
    };
    networking.firewall = {
      allowedUDPPorts = [
        5353 # mdns
        5355 # LLMNR
      ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
