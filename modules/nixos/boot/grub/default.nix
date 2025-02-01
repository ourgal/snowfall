args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot.loader.grub.device = "/dev/sda";
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
