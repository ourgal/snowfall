args:
args.module (
  args
  // {
    path = ./.;
    progs.kitty = {
      catppuccin.enable = false;
      theme = "Tomorrow Night Bright";
      font = {
        name = "FiraCode Nerd Font Mono";
        size = 14;
      };
      settings = {
        copy_on_select = "yes";
        allow_remote_contorl = "yes";
        listen_on = "unix:/tmp/kitty";
        enabled_layouts = "splits";
        background_opacity = "0.8";
      };
      keybindings = {
        "ctrl+shift+p>u" = "kitten hints --type url --program @";
      };
    };
  }
)
