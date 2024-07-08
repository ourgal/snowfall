{ ... }@args:
args.module (
  args
  // {
    path = ./.;
    progs = {
      wezterm = {
        extraConfig = # lua
          ''
            local wezterm = require("wezterm")

            return {
            	color_scheme = "tokyonight_night",
            	window_decorations = "NONE",
              font = wezterm.font_with_fallback({
                "Fira Code",
                "Source Han Sans SC",
              }),
            	font_size = 14.0,
            	window_background_opacity = 0.8,
            	hide_tab_bar_if_only_one_tab = true,
            }
          '';
      };
    };
  }
)
