{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    confs = {
      awesome = [
        ./rc.lua
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
    };
  }
)
