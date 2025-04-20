args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    services.xserver.displayManager.gdm = enabled // {
      wayland = true;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
