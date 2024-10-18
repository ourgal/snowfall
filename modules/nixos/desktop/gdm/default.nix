args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.xserver.displayManager.gdm = enabled // {
      wayland = true;
    };
  };
  path = ./.;
  _args = {
    inherit value path args;
  };
in
nixosModule _args
