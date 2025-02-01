args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    programs = {
      fish = enabled;
      light = enabled // {
        brightnessKeys = enabled;
      };
      vim = enabled // {
        defaultEditor = true;
      };
    };
    security.doas = enabled;
  };
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
