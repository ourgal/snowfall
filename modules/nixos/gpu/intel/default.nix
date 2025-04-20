args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.variables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
