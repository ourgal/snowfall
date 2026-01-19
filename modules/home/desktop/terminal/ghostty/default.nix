args:
args.module (
  args
  // (
    let
      inherit (args) lib;
    in
    {
      progs.ghostty.settings = {
        font-family = lib.mkDefault "monospace";
        font-size = lib.mkDefault 14;
        cursor-style = "bar";
        background-opacity = lib.mkDefault 0.8;
        window-decoration = false;
        auto-update = "off";
        theme = lib.mkDefault "catppuccin-mocha";
      };
    }
  )
)
