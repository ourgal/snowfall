args:
args.module (
  args
  // {
    path = ./.;
    progs.alacritty.settings = {
      live_config_reload = true;
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
    };
  }
)
