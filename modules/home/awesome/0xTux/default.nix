{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    confs = {
      awesome = [
        ./rc.lua
        ./config
        ./signal
        ./theme
        ./ui
        ./binds
      ];
    };
  }
)
