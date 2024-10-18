args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.firewall.allowedUDPPorts = [ 4010 ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
