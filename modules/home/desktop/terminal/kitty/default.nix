args:
args.module (
  args
  // (
    let
      inherit (args) host lib;
    in
    {
      confs."kitty/sessions/tmux" = "launch tmux a";
      progs.kitty = {
        themeFile = "Tomorrow_Night_Bright";
        font = {
          name = lib.mkDefault "monospace";
          size = lib.mkDefault (if host == "surface" then 21 else 14);
        };
        settings = {
          copy_on_select = "yes";
          listen_on = "unix:/tmp/kitty";
          enabled_layouts = "splits";
          background_opacity = lib.mkDefault 0.8;
          cursor_trail = 0;
          cursor_trail_decay = "0.1 0.4";
        };
        keybindings = {
          "ctrl+shift+p>u" = "kitten hints --type url --program @";
        };
      };
    }
  )
)
