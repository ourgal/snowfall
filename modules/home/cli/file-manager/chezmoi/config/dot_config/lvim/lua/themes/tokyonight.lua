local M = {}

M.config = function()
  -- require("tokyonight").setup {
  lvim.builtin.theme.tokyonight.options = {
    style = "storm",
    transparent = lvim.transparent_window,
    terminal_colors = true,
    styles = {
      comments = {},
      keywords = { italic = true },
      functions = {},
      variables = {},
      sidebars = "dark",
      floats = "dark",
    },
    sidebars = {
      "qf",
      "vista_kind",
      "terminal",
      "packer",
      "spectre_panel",
      "NeogitStatus",
      "help",
    },
    day_brightness = 0.3,
    hide_inactive_statusline = true,
    dim_inactive = true,
    lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

    on_colors = function(colors)
      colors.git = { change = "#6183bb", add = "#449dab", delete = "#f7768e", conflict = "#bb7a61" }
      colors.bg_dark = "#1a1e30"
      colors.bg_dim = "#1f2335"
      colors.bg_float = "#1a1e30"
    end,
    on_highlights = function(hl, c)
      c.bg_dark = "#1a1e30"
      c.bg_dim = "#1f2335"
      c.bg_float = "#1a1e30"
      local current_colors = M.colors.tokyonight_colors
      hl.NormalFloat = { fg = current_colors.fg, bg = "#181924" }
      hl.Cursor = { fg = current_colors.bg, bg = current_colors.fg }
      hl.NormalNC = { fg = current_colors.fg_dark, bg = "#1c1d28" }
      hl.Normal = { fg = current_colors.fg, bg = "#1f2335" }
      hl.CursorLineNr = { fg = current_colors.orange, style = "bold" }
    end,
  }
end
cond = function()
  local _time = os.date("*t")
  return (_time.hour >= 9 and _time.hour < 17) and lvim.user_plugins.time_based_themes
end

return M
