{ lib, namespace }:
let
  inherit (lib.${namespace}) enabled;
in
{
  # https://github.com/tinted-theming/schemes/tree/spec-0.11/base16
  stylix = {
    theme = builtins.head [
      "google-dark"
      "tokyo-night-terminal-dark"
      "ayu-dark"
      "github-dark"
      "tokyonight-dark"
    ];
    defaultConfig =
      pkgs:
      enabled
      // {
        base16Scheme = "${pkgs.base16-schemes}/share/themes/${lib.${namespace}.stylix.theme}.yaml";
        opacity.terminal = 0.9;
        fonts.monospace =
          let
            inherit (lib.${namespace}.font) en getFontPkg;
          in
          {
            name = en.mono.name;
            package = getFontPkg pkgs en.mono;
          };
      };
  };
}
