args:
args.module (
  args
  // {
    path = ./.;
    progs.ghostty.settings = {
      font-family = "monospace";
      font-size = 14;
      cursor-style = "bar";
      background-opacity = 0.8;
      window-decoration = false;
      auto-update = "off";
      theme = "catppuccin-mocha";
    };
  }
)
