args:
args.module (
  args
  // (
    let
      baseConfig = builtins.readFile ./rc.lua;
      terminal = "wezterm";
      hostConfig =
        if (args.host == "home") then # lua
          ''
            local awful = require("awful")
            awful.spawn("${terminal}", { screen = 1, tag = "1" })
            awful.spawn("firefox", { screen = 1, tag = "2" })
            awful.spawn("${terminal}", { screen = 2, tag = "1" })
            awful.spawn("brave", { screen = 2, tag = "2" })
          ''
        # lua
        else
          ''
            local awful = require("awful")
            awful.spawn("${terminal}")
          '';
      finalConfig = baseConfig + hostConfig;
    in
    {
      path = ./.;
      nixPkgs = [
        # keep-sorted start
        "blueman"
        "pavucontrol"
        "upower"
        # keep-sorted end
      ];
      myPkgs = [
        # keep-sorted start
        "icomoon"
        "jetbrains-mono"
        # keep-sorted end
      ];
      xfcePkgs = "thunar";
      confs = [
        { "awesome/rc.lua" = finalConfig; }
        {
          # https://github.com/AllJavi/tartarus-dotfiles
          awesome = [
            ./configuration
            ./layout
            ./module
            ./sharedtags
            ./theme
            ./utilities
            ./widget
          ];
        }
      ];
    }
  )
)
