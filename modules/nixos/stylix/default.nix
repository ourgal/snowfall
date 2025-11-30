args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule enabled;
  value = {
    stylix = enabled // {
      base16Scheme = "${pkgs.base16-schemes}/share/themes/${lib.${namespace}.stylix.theme}.yaml";
      opacity.terminal = 0.9;
      fonts.monospace = {
        name = "Fira Code";
        package = pkgs.fira-code;
      };
      homeManagerIntegration.autoImport = false;
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
