args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) darwinModule enabled;
  value = {
    programs = {
      fish = enabled;
      vim = enabled;
    };
  };
  _args = { inherit value args; };
in
darwinModule _args
