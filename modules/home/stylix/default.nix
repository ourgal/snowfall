args:
args.module (
  args
  // (
    let
      inherit (args) namespace pkgs lib;
      inherit (lib.${namespace}) enabled;
    in
    {
      value = {
        stylix = enabled // {
          base16Scheme = "${pkgs.base16-schemes}/share/themes/${lib.${namespace}.stylix.theme}.yaml";
          opacity.terminal = 0.9;
          fonts.monospace = {
            name = "Fira Code";
            package = pkgs.fira-code;
          };
        };
      };
    }
  )
)
