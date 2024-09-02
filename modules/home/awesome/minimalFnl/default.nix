{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    confs = {
      awesome = [
        # keep-sorted start
        ./autostart.lua
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
    };
  }
)
