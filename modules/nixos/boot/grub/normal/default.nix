args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.loader.grub = {
      device = "/dev/sda";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
