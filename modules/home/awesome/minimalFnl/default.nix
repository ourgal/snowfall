{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) namespace;
      inherit (args.config.${namespace}.user) terminal browser browserS;
      hostConfig =
        if (args.host == "home") then # lua
          ''
            local awful = require("awful")
            awful.spawn("${terminal}", { screen = 1, tag = "1" })
            awful.spawn("${browser}", { screen = 1, tag = "2" })
            awful.spawn("${terminal}", { screen = 2, tag = "1" })
            awful.spawn("${browserS}", { screen = 2, tag = "2" })
          ''
        # lua
        else
          ''
            local awful = require("awful")
            awful.spawn("${terminal}")
          '';
      finalConfig = hostConfig;
    in
    {
      path = ./.;
      confs = [
        { "awesome/autostart.lua" = finalConfig; }
        {
          awesome = [
            # keep-sorted start
            ./error_handing.lua
            ./keys
            ./layouts.lua
            ./menu.lua
            ./mouse.lua
            ./rc.lua
            ./rules
            ./screen.lua
            ./settings.lua
            ./signals.lua
            ./themes
            ./wallpaper.lua
            # keep-sorted end
          ];
        }
      ];
    }
  )
)
