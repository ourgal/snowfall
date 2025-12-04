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
              { command = lib.getExe pkgs.${namespace}.swww-wallsetter; }
            ];
            keybindings =
              let
                inherit (config.wayland.windowManager.sway.config) modifier;
              in
              lib.mkOptionDefault {
                "${modifier}+Return" = "exec ${lib.getExe pkgs.kitty}";
                "${modifier}+Shift+c" = "kill";
                "${modifier}+d" = "exec ${lib.getExe pkgs.rofi} -show drun";
              };
          };
        };
      };
    }
  )
)
