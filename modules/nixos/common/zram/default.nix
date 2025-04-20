args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.zram-generator = enabled // {
      settings = {
        zram0 = { };
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
