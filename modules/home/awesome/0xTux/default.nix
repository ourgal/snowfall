{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    confs = {
      awesome = [
        ./rc.lua
        ./settings.lua
        ./config
        ./signal
        ./theme
        ./ui
        ./binds
      ];
    };
  }
)