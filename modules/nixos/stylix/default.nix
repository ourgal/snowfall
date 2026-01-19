args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    stylix = (lib.${namespace}.stylix.defaultConfig pkgs) // {
      homeManagerIntegration.autoImport = false;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
