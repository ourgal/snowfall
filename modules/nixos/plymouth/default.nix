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
  path = ./.;
  _args = { inherit value path args; };
in
nixosModule _args
