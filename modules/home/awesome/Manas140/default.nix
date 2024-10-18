args:
args.module (
  args
  // {
    path = ./.;
    nixPkgs = [
      "xsettingsd"
      "elogind"
      "jetbrains-mono"
      "material-icons"
    ];
    confs = {
      awesome = [
        ./rc.lua
        ./client.lua
        ./help.lua
        ./keys.lua
        ./menu.lua
        ./music.lua
        ./notif.lua
        ./rule.lua
        ./signals.lua
        ./titlebar.lua
        ./bar
        ./dashboard
        ./theme
        ./wid
      ];
    };
  }
)
