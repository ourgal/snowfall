args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) enabled nixosModule;
  value = {
    services.earlyoom = enabled;
  };
  _args = { inherit value args; };
in
nixosModule _args
