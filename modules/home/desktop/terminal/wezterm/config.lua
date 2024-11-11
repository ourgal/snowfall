local wezterm = require("wezterm")

return {
  color_scheme = "Tomorrow Night Bright",
  window_decorations = "NONE",
  font = wezterm.font_with_fallback({
    "Fira Code",
    "Source Han Sans SC",
  }),
  font_size = 14.0,
  window_background_opacity = 0.8,
  default_cursor_style = "SteadyBar",
  hide_tab_bar_if_only_one_tab = true,
}
