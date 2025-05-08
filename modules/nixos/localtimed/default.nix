args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    services.localtimed.enable = true;
  };
  _args = { inherit value args; };
in
nixosModule _args
