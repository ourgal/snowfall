{ ... }@args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.firewall.allowedTCPPorts = [ 50000 ];
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
