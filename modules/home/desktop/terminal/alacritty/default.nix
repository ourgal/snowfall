args:
args.module (
  args
  // (
    let
      tomorrow_night_bright = {
        colors = {
          primary = {
            background = "#000000";
            foreground = "#eaeaea";
          };
          normal = {
            black = "#000000";
            red = "#d54e53";
            green = "#b9ca4a";
            yellow = "#e6c547";
            blue = "#7aa6da";
            magenta = "#c397d8";
            cyan = "#70c0ba";
            white = "#424242";
          };
          bright = {
            black = "#666666";
            red = "#ff3334";
            green = "#9ec400";
            yellow = "#e7c547";
            blue = "#7aa6da";
            magenta = "#b77ee0";
            cyan = "#54ced6";
            white = "#2a2a2a";
          };
        };
      };
    in
    {
      path = ./.;
      progs.alacritty = {
        settings = {
          general.live_config_reload = true;
          env.TERM = "xterm-256color";
          window = {
            decorations = "none";
            dynamic_title = true;
            opacity = 0.8;
          };
          cursor = {
            blink_interval = 550;
            unfocused_hollow = false;
            thickness = 0.15;
            style = {
              blinking = "On";
              shape = "Block";
            };
          };
          bell = {
            animation = "Linear";
            duration = 0;
          };
          selection.save_to_clipboard = true;
          font = {
            normal.family = "FiraCode Nerd Font";
            size = 14.0;
            builtin_box_drawing = true;
          };
        } // tomorrow_night_bright;
      };
      value.catppuccin.alacritty.enable = false;
    }
  )
)
