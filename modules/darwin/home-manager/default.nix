args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) darwinModule;
  value = {
    home-manager = {
      extraSpecialArgs = lib.${namespace}.SpecialArgs;
      backupFileExtension = "backup";
    };
  };
  _args = { inherit value args; };
in
darwinModule _args
