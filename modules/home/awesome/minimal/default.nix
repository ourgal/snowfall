{ ... }@args:
args.module (
  args
  // (
    let
      baseConfig = builtins.readFile ./rc.lua;
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
