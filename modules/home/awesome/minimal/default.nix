{ ... }@args:
args.module (
  args
  // (
    with args;
    let
      baseConfig = builtins.readFile ./rc.lua;
      terminal = "wezterm";
      hostConfig =
        if (host == "home") then # lua
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
      confs = [
        { "awesome/rc.lua" = finalConfig; }
        {
          awesome = [
            ./error_handing.lua
            ./keys.lua
            ./layouts.lua
            ./menu.lua
            ./mouse.lua
            ./rules.lua
            ./screen.lua
            ./settings.lua
            ./signals.lua
            ./themes
          ];
        }
      ];
    }
  )
)
