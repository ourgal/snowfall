args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.tlp = enabled // {
      settings = {
        STOP_CHARGE_THRESH_BAT0 = 85;
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
