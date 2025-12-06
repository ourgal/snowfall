args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    home-manager = {
      extraSpecialArgs = lib.${namespace}.SpecialArgs;
      backupCommand = lib.getExe pkgs.trash-cli;
      backupFileExtension = "backup";
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
