args:
let
  inherit (args) namespace lib pkgs;
  inherit (lib.${namespace}) nixosModule;
  value = {
    boot = {
      kernelParams = [ "quiet" ];
      plymouth = {
        enable = true;
        theme = "catppuccin-macchiato";
        themePackages = [ pkgs.catppuccin-plymouth ];
      };
    };
  };
  _args = { inherit value args; };
in
nixosModule _args
