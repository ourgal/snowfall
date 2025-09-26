args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    programs = {
      fish = enabled;
      vim = enabled // {
        defaultEditor = true;
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
