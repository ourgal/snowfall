args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    hardware.bluetooth = enabled;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
