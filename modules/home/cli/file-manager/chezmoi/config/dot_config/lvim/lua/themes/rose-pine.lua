local M = {}

M.config = function()
  table.insert(lvim.plugins, {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        ---@usage 'main'|'moon'
        dark_variant = "main",
        bold_vert_split = false,
        dim_nc_background = lvim.builtin.global_statusline,
        disable_background = lvim.transparent_window,
        disable_float_background = true,
        disable_italics = true,
        ---@usage string hex value or named color from rosepinetheme.com/palette
        groups = {
          border = "highlight_med",
          comment = "muted",
          link = "iris",
          punctuation = "subtle",

          error = "love",
          hint = "iris",
          info = "foam",
          warn = "gold",

          headings = {
            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          },
        },
        highlight_groups = {
          Boolean = { fg = "love" },
          Cursor = { fg = "#232136", bg = "text" },
          NormalFloat = { bg = "base" },
          MsgArea = { fg = "text" },
          VertSplit = { fg = "highlight_low", bg = "highlight_low" },
          SignColumn = { fg = "text", bg = "none" },
          SignColumnSB = { fg = "text", bg = "none" },
          mkdInlineURL = { fg = "iris", style = "none" },
          ["@variable"] = { fg = "text" },
          ["@variable.builtin"] = { fg = "love" },
          ["@type"] = { fg = "foam" },
          ["@text"] = { fg = "text" },
          ["@property"] = { fg = "iris" },
          ["@parameter"] = { fg = "iris" },
          ["@constant.builtin"] = { fg = "love" },
          ["@constant"] = { fg = "foam" },
          ["@constructor"] = { fg = "foam" },
          ["@field"] = { fg = "foam" },
          ["@function.builtin"] = { fg = "love" },
          ["@function"] = { fg = "rose" },
          ["@include"] = { fg = "pine" },
          ["@keyword"] = { fg = "pine" },
          ["@keyword.operator"] = { fg = "subtle" },
          ["@label"] = { fg = "foam" },
          ["@punctuation.bracket"] = { fg = "muted" },
          ["@punctuation.delimiter"] = { fg = "muted" },
          ["@punctuation.special"] = { fg = "muted" },
          ["@string.escape"] = { fg = "pine" },
          ["@string.special"] = { fg = "gold" },
          ["@tag"] = { fg = "foam" },
          ["@tag.delimiter"] = { fg = "subtle" },
          ["@text.title"] = { fg = "iris", style = "bold" },
          ["@text.uri"] = { fg = "iris" },
          CmpItemKindText = { fg = "gold" },
          CmpItemKindConstructor = { fg = "foam" },
          CmpItemKindField = { fg = "foam" },
          CmpItemKindValue = { fg = "text" },
          CmpItemKindEvent = { fg = "text" },
          CmpItemKindUnit = { fg = "gold" },
          CmpItemKindConstant = { fg = "gold" },
          CmpItemKindModule = { fg = "iris" },
          CmpItemKindEnum = { fg = "#c5a8e8" },
          CmpItemKindStruct = { fg = "#56949f" },
          CmpItemKindTypeParameter = { fg = "foam" },
          CmpItemKindTypeKeyword = { fg = "pine" },
          CmpItemKindTypeDirectory = { fg = "foam" },
          CmpItemKindReference = { fg = "gold" },
          CmpItemKindOperator = { fg = "subtle" },
          CmpItemKindTypeSnippet = { fg = "pine" },
        },
      })
      vim.cmd([[colorscheme rose-pine]])
    end,
    cond = function()
      local _time = os.date("*t")
      return (_time.hour >= 1 and _time.hour < 9) and lvim.user_plugins.time_based_themes
    end,
  })
end
return M
