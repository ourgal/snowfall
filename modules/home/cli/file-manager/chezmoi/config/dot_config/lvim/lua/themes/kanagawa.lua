local M = {}

M.config = function()
  table.insert(lvim.plugins, {
    "rebelot/kanagawa.nvim",
    config = function()
      local kanagawa = require("kanagawa")
      kanagawa.setup({
        undercurl = true, -- enable undercurls
        commentStyle = {},
        functionStyle = {},
        keywordStyle = { italic = true },
        statementStyle = { italic = true },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        dimInactive = lvim.builtin.global_statusline, -- dim inactive window `:h hl-NormalNC`
        globalStatus = lvim.builtin.global_statusline, -- adjust window separators highlight for laststatus=3
        transparent = lvim.transparent_window,
        colors = { sumiInk1b = "#1b1b23" },
        overrides = {
          diffRemoved = { fg = "#E46876" },
          NvimTreeFolderIcon = { fg = "#7e9cd8" },
          CmpItemKindEnum = { fg = "#957FB8" },
          ["@parameter"] = { fg = "#DCA561" },
        },
      })
      vim.cmd([[colorscheme kanagawa]])
    end,
    cond = function()
      local _time = os.date("*t")
      return ((_time.hour >= 21 and _time.hour < 24) or (_time.hour >= 0 and _time.hour < 1))
        and lvim.user_plugins.time_based_themes
    end,
  })
end
return M
