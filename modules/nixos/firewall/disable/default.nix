args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    networking.firewall.enable = false;
  };
  _args = { inherit value args; };
in
nixosModule _args
