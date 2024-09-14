{ ... }@args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib config;
    in
    {
      path = ./.;
      confs = {
        awesome = [
          # keep-sorted start
          ./Makefile
          ./autostart.fnl
          ./error_handing.fnl
          ./keys
          ./layouts.fnl
          ./menu.fnl
          ./mouse.fnl
          ./rc.fnl
          ./rules
          ./screen.fnl
          ./settings.fnl
          ./signals.fnl
          ./themes
          ./wallpaper.fnl
          # keep-sorted end
        ];
      };
      value = {
        home.activation.aweome_minimalFnl = config.lib.dag.entryAfter [ "reloadSystemd" ] ''
          PATH=$PATH:${
            lib.makeBinPath [
              pkgs.gnumake
              pkgs.fennel
            ]
          }
          make -C ${config.xdg.configHome}/awesome -B
        '';
      };
    }
  )
)
