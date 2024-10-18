args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    environment.variables = {
      LIBVA_DRIVER_NAME = "iHD";
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
