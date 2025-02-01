args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    boot.loader.systemd-boot = enabled;
    boot.loader.efi.canTouchEfiVariables = true;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
