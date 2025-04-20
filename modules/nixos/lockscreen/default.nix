args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.xserver.xautolock = enabled;
  };
  _args = { inherit value args; };
in
nixosModule _args
