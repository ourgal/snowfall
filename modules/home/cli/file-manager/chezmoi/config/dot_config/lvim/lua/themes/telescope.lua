local M = {}

M.hi_colors = function()
  local colors = {
    bg = "#16161D",
    bg_alt = "#1F1F28",
    fg = "#DCD7BA",
    green = "#76946A",
    red = "#E46876",
  }
  local color_binds = {
    bg = { group = "NormalFloat", property = "background" },
    bg_alt = { group = "Cursor", property = "foreground" },
    fg = { group = "Cursor", property = "background" },
    green = { group = "diffAdded", property = "foreground" },
    red = { group = "diffRemoved", property = "foreground" },
  }
  local function get_hl_by_name(name)
    local ret = vim.api.nvim_get_hl_by_name(name.group, true)
    return string.format("#%06x", ret[name.property])
  end

  for k, v in pairs(color_binds) do
    local found, color = pcall(get_hl_by_name, v)
    if found then
      colors[k] = color
    end
  end
  return colors
end

M.config = function()
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

  -- NOTE: these are my personal preferences
  if lvim.user_plugins.time_based_themes then
    local _time = os.date("*t")
    local current_colors = require("themes.utils").current_colors()
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
