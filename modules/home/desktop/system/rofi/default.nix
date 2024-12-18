args:
args.module (
  args
  // (
    let
      inherit (args) pkgs lib config;
    in
    {
      path = ./.;
      progs.rofi = {
        cycle = true;
        terminal = "${pkgs.kitty}/bin/kitty";
        theme = lib.mkIf (!config.catppuccin.enable) "spotlight";
        plugins = [ pkgs.rofi-emoji ];
        extraConfig = {
          modes = "drun,power:${pkgs.rofi-power-menu}/bin/rofi-power-menu,emoji";
          font = "FiraCode Mono 14";
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
    }
  )
)
