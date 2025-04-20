args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    boot.loader.systemd-boot = enabled;
    boot.loader.efi.canTouchEfiVariables = true;
  };
  _args = { inherit value args; };
in
nixosModule _args
