args:
args.module (
  args
  // (
    let
      inherit (args)
        enabled
        pkgs
        namespace
        config
        lib
        ;
    in
    {
      value = {
        wayland.windowManager.sway = enabled // {
          config = {
            bars = [ ];
            modifier = "Mod4";
            terminal = "kitty";
            startup = [
              { command = "kitty"; }
              { command = "${pkgs.${namespace}.swww-wallsetter}/bin/swww-wallsetter"; }
            ];
            keybindings =
              let
                inherit (config.wayland.windowManager.sway.config) modifier;
              in
              lib.mkOptionDefault {
                "${modifier}+Return" = "exec ${pkgs.kitty}/bin/kitty";
                "${modifier}+Shift+c" = "kill";
                "${modifier}+d" = "exec ${pkgs.rofi-wayland}/bin/rofi -show drun";
              };
          };
        };
      };
    }
  )
)
