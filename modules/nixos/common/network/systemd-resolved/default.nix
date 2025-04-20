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
        5353
        5355
      ];
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
