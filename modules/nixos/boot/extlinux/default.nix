args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled disabled;
  value = {
    boot.loader.grub = disabled;
    boot.loader.generic-extlinux-compatible = enabled;
  };
  _args = { inherit value args; };
in
nixosModule _args
