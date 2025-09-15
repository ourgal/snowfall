args:
let
  inherit (args) namespace lib;
  inherit (lib.${namespace}) nixosModule;
  value = {
    home-manager = {
      extraSpecialArgs = lib.${namespace}.SpecialArgs;
      backupFileExtension = "backup";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
