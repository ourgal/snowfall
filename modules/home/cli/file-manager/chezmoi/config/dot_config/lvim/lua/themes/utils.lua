local M = {}

M.colors = {
  tokyonight_colors = {
    cmp_border = "#181924",
    none = "NONE",
    bg_dark = "#1f2335",
    bg_alt = "#1a1b26",
    bg = "#24283b",
    bg_br = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue0 = "#3d59a1",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#B4F9F8",
    blue7 = "#394b70",
    violet = "#bb9af7",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",
    hlargs = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",
    -- git = { change = "#6183bb", add = "#449dab", delete = "#914c54", conflict = "#bb7a61" },
    git = { change = "#6183bb", add = "#449dab", delete = "#f7768e", conflict = "#bb7a61" },
    gitSigns = { add = "#164846", change = "#394b70", delete = "#823c41" },
  },

  rose_pine_colors = {
    cmp_border = "#191724",
    none = "NONE",
    bg = "#2a273f",
    fg = "#e0def4",
    fg_gutter = "#3b4261",
    black = "#393b44",
    gray = "#2a2e36",
    red = "#eb6f92",
    green = "#97c374",
    yellow = "#ea9d34",
    hlargs = "#c4a7e7",
    blue = "#9ccfd8",
    magenta = "#c4a7e7",
    cyan = "#9ccfd8",
    white = "#dfdfe0",
    orange = "#ea9a97",
    pink = "#D67AD2",
    black_br = "#7f8c98",
    red_br = "#e06c75",
    green_br = "#58cd8b",
    yellow_br = "#FFE37E",
    bg_br = "#393552",
    blue_br = "#84CEE4",
    violet = "#B8A1E3",
    cyan_br = "#59F0FF",
    white_br = "#FDEBC3",
    orange_br = "#F6A878",
    pink_br = "#DF97DB",
    comment = "#526175",
    bg_alt = "#191724",
    git = {
      add = "#84Cee4",
      change = "#c4a7e7",
      delete = "#eb6f92",
      conflict = "#f6c177",
    },
  },

  catppuccin_colors = {
    cmp_border = "#151521",
    rosewater = "#F5E0DC",
    flamingo = "#F2CDCD",
    violet = "#DDB6F2",
    pink = "#F5C2E7",
    red = "#F28FAD",
    maroon = "#E8A2AF",
    orange = "#FAB387",
    yellow = "#F9E2AF",
    hlargs = "#EBA0AC",
    green = "#ABE9B3",
    blue = "#96CDFB",
    cyan = "#89DCEB",
    teal = "#B5E8E0",
    lavender = "#C9CBFF",
    white = "#D9E0EE",
    gray2 = "#C3BAC6",
    gray1 = "#988BA2",
    gray0 = "#6E6C7E",
    black4 = "#575268",
    bg_br = "#302D41",
    bg = "#302D41",
    surface1 = "#302D41",
    bg_alt = "#1E1E2E",
    fg = "#D9E0EE",
    black = "#1A1826",
    git = {
      add = "#ABE9B3",
      change = "#96CDFB",
      delete = "#F28FAD",
      conflict = "#FAE3B0",
    },
  },

  kanagawa_colors = {
    cmp_border = "#16161D",
    bg = "#21212A",
    bg_alt = "#1F1F28",
    bg_br = "#363646",
    fg = "#DCD7BA",
    red = "#E46876",
    orange = "#FFA066",
    yellow = "#DCA561",
    hlargs = "#DCA561",
    blue = "#7FB4CA",
    cyan = "#658594",
    violet = "#957FB8",
    magenta = "#938AA9",
    green = "#76946A",
    git = {
      add = "#76946A",
      conflict = "#DCA561",
      delete = "#E46876",
      change = "#7FB4CA",
    },
  },
}

M.current_colors = function()
  local colors = M.colors.tokyonight_colors
  if not lvim.user_plugins.time_based_themes then
    return colors
  end
  local _time = os.date("*t")
  if _time.hour >= 1 and _time.hour < 9 then
    colors = M.colors.rose_pine_colors
  elseif _time.hour >= 9 and _time.hour < 17 then
    colors = M.colors.tokyonight_colors
  elseif _time.hour >= 17 and _time.hour < 21 then
    colors = M.colors.catppuccin_colors
  elseif (_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1) then
    colors = M.colors.kanagawa_colors
  end
  return colors
end

M.toggle_theme = function()
  local theme = lvim.colorscheme
  local colorset = require("themes.utils").colors.tokyonight_colors
  if theme == "tokyonight" then
    lvim.colorscheme = "catppuccin-mocha"
    colorset = require("themes.utils").colors.catppuccin_colors
  else
    lvim.colorscheme = "tokyonight"
  end

  if vim.g.toggle_theme_icon == "   " then
    vim.g.toggle_theme_icon = "   "
  else
    vim.g.toggle_theme_icon = "   "
  end
  vim.cmd("colorscheme " .. lvim.colorscheme)
  require("themes.utils").telescope_theme(colorset)
end

M.telescope_theme = function(colorset)
  local function link(group, other)
    vim.cmd("highlight! link " .. group .. " " .. other)
  end

  local function set_bg(group, bg)
    vim.cmd("hi " .. group .. " guibg=" .. bg)
  end

  local function set_fg_bg(group, fg, bg)
    vim.cmd("hi " .. group .. " guifg=" .. fg .. " guibg=" .. bg)
  end

  set_fg_bg("SpecialComment", "#9ca0a4", "bold")
  link("FocusedSymbol", "LspHighlight")
  link("LspCodeLens", "SpecialComment")
  link("LspDiagnosticsSignError", "DiagnosticError")
  link("LspDiagnosticsSignHint", "DiagnosticHint")
  link("LspDiagnosticsSignInfo", "DiagnosticInfo")
  link("NeoTreeDirectoryIcon", "NvimTreeFolderIcon")
  link("IndentBlanklineIndent1 ", "@comment")
  if vim.fn.has("nvim-0.9") == 1 then
    link("@lsp.type.decorator", "@function")
    link("@lsp.type.enum", "@type")
    link("@lsp.type.enumMember", "@constant")
    link("@lsp.type.function", "@function")
    link("@lsp.type.interface", "@interface")
    link("@lsp.type.keyword", "@keyword")
    link("@lsp.type.macro", "@macro")
    link("@lsp.type.method", "@method")
    link("@lsp.type.namespace", "@namespace")
    link("@lsp.type.parameter", "@parameter")
    link("@lsp.type.property", "@property")
    link("@lsp.type.struct", "@structure")
    link("@lsp.type.variable", "@variable")
    link("@lsp.type.class", "@type")
    link("@lsp.type.type", "@type")
    link("@lsp.typemod.function.defaultLibrary", "Special")
    link("@lsp.typemod.variable.defaultLibrary", "@variable.builtin")
    -- link("@lsp.typemod.variable.global", "@constant.builtin")
    link("@lsp.typemod.operator", "@operator")
    link("@lsp.typemod.string", "@string")
    link("@lsp.typemod.variable", "@variable")
    link("@lsp.typemod.parameter.label", "@field")
    link("@type.qualifier", "@keyword")
  end

  -- NOTE: these are my personal preferences
  if lvim.builtin.time_based_themes then
    local current_colors = colorset
    if colorset == nil or #colorset == 0 then
      current_colors = M.current_colors()
    end
    set_fg_bg("Hlargs", current_colors.hlargs, "none")
    set_fg_bg("CmpBorder", current_colors.cmp_border, current_colors.cmp_border)
    link("NoiceCmdlinePopupBorder", "CmpBorder")
    link("NoiceCmdlinePopupBorderCmdline", "CmpBorder")
    link("NoiceCmdlinePopupBorderFilter", "CmpBorder")
    link("NoiceCmdlinePopupBorderHelp", "CmpBorder")
    link("NoiceCmdlinePopupBorderIncRename", "CmpBorder")
    link("NoiceCmdlinePopupBorderInput", "CmpBorder")
    link("NoiceCmdlinePopupBorderLua", "CmpBorder")
    link("NoiceCmdlinePopupBorderSearch", "CmpBorder")
    set_fg_bg("diffAdded", current_colors.git.add, "NONE")
    set_fg_bg("diffRemoved", current_colors.git.delete, "NONE")
    set_fg_bg("diffChanged", current_colors.git.change, "NONE")
    set_fg_bg("WinSeparator", current_colors.bg_alt, current_colors.bg_alt)
    set_fg_bg("SignColumn", current_colors.bg, "NONE")
    set_fg_bg("SignColumnSB", current_colors.bg, "NONE")
  end

  local colors = M.hi_colors()
  -- set_fg_bg("WinSeparator", colors.bg, "None")
  set_fg_bg("NormalFloat", colors.fg, colors.bg)
  set_fg_bg("FloatBorder", colors.fg, colors.bg)
  set_fg_bg("TelescopeBorder", colors.bg_alt, colors.bg)
  set_fg_bg("TelescopePromptBorder", colors.bg, colors.bg)
  set_fg_bg("TelescopePromptNormal", colors.fg, colors.bg_alt)
  set_fg_bg("TelescopePromptPrefix", colors.red, colors.bg)
  set_bg("TelescopeNormal", colors.bg)
  set_fg_bg("TelescopePreviewTitle", colors.bg, colors.green)
  set_fg_bg("LvimInfoHeader", colors.bg, colors.green)
  set_fg_bg("LvimInfoIdentifier", colors.red, colors.bg_alt)
  set_fg_bg("TelescopePromptTitle", colors.bg, colors.red)
  set_fg_bg("TelescopeResultsTitle", colors.bg, colors.bg)
  set_fg_bg("TelescopeResultsBorder", colors.bg, colors.bg)
  set_bg("TelescopeSelection", colors.bg_alt)
end

return M
