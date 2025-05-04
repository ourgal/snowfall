args:
args.module (
  args
  // (
    let
      inherit (args) config pkgs lib;
    in
    {
      servs = "betterlockscreen";
      value = {
        home.activation.betterlockscreen = config.lib.dag.entryAfter [ "reloadSystemd" ] ''
          PATH=$PATH:${
            lib.makeBinPath [
              pkgs.betterlockscreen
              pkgs.xorg.xrdb
            ]
          }
          ! test -d ${config.home.homeDirectory}/.cache/betterlockscreen && ${lib.getExe pkgs.betterlockscreen} -u $(find ${config.home.homeDirectory}/Pictures/wallpapers/ -type f | shuf -n 1)
        '';
      };
    }
  )
)
