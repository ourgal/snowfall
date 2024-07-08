{ ... }@args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    services.udev = {
      packages = [ pkgs.android-udev-rules ];
      extraRules = ''SUBSYSTEM=="usb", ATTR{idVendor}=="12d1", ATTR{idProduct}=="107e", MODE="0666", GROUP="plugdev"'';
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
