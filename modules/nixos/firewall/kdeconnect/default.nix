args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  range = [
    {
      from = 1714;
      to = 1764;
    }
  ];
  value = {
    networking.firewall = {
      allowedTCPPortRanges = range;
      allowedUDPPortRanges = range;
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
