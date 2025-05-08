args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    services.automatic-timezoned.enable = true;
  };
  _args = { inherit value args; };
in
nixosModule _args
