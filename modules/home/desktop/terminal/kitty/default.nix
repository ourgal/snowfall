{
  progs.kitty = {
    themeFile = "Tomorrow_Night_Bright";
    font = {
      name = "monospace";
      size = 14;
    };
    settings = {
      copy_on_select = "yes";
      listen_on = "unix:/tmp/kitty";
      enabled_layouts = "splits";
      background_opacity = "0.8";
      cursor_trail = 0;
    };
    keybindings = {
      "ctrl+shift+p>u" = "kitten hints --type url --program @";
    };
  };
  value.catppuccin.kitty.enable = false;
}
