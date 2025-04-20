args:
args.module (
  args
  // (
    let
      inherit (args)
        pkgs
        lib
        config
        mkOpt'
        namespace
        ;
      cfg = config.${namespace}.desktop.system.rofi;
    in
    {
      progs.rofi = {
        cycle = true;
        terminal = "${pkgs.kitty}/bin/kitty";
        theme = lib.mkIf (!config.catppuccin.enable) "spotlight";
        plugins = [ pkgs.rofi-emoji ];
        extraConfig = {
          modes = lib.strings.concatStringsSep "," cfg.modes;
          font = "monospace 14";
          kb-element-next = "";
          kb-element-prev = "";
          kb-row-select = "Tab";
        };
      };
      confs.rofi = [
        ./tokyonight.rasi
        ./spotlight.rasi
      ];
      value = {
        xdg.desktopEntries.rofi-screenshot = {
          name = "Rofi-screenshot";
          exec = "rofi-screenshot";
        };
      };
      enable = "power-menu";
      extraOpts = {
        modes = mkOpt' (lib.types.listOf lib.types.str) [ "drun" ];
      };
    }
  )
)
