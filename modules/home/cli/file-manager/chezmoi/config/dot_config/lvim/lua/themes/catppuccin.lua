local M = {}

M.config = function()
  table.insert(lvim.plugins, {
    "catppuccin/nvim",
    name = "catppuccin",
    init = function()
      vim.g.catppuccin_flavour = "mocha"
    end,
    config = function()
      local catppuccin = require("catppuccin")
      local opts = {
        flavour = "mocha",
        background = { light = "latte", dark = "mocha" },
        transparent_background = lvim.transparent_window,
        term_colors = false,
        styles = {
          comments = {},
          keywords = { "italic" },
        },
        compile = {
          enabled = true, -- NOTE: make sure to run `:CatppuccinCompile`
          path = vim.fn.stdpath("cache") .. "/catppuccin",
        },
        dim_inactive = {
          enabled = lvim.builtin.global_statusline,
          shade = "dark",
          percentage = 0.15,
        },
        integrations = {
          cmp = true,
          fidget = true,
          lsp_trouble = true,
          telescope = true,
          treesitter = true,
          mason = true,
          neotest = lvim.builtin.test_runner == "neotest",
          noice = lvim.user_plugins.edit.misc.notification.noice,
          native_lsp = {
            enabled = true,
            virtual_text = {
              errors = { "italic" },
              hints = {},
              warnings = { "italic" },
              information = {},
            },
            underlines = {
              errors = { "undercurl" },
              hints = {},
              warnings = { "undercurl" },
              information = {},
            },
          },
          dap = {
            enabled = lvim.builtin.dap.active,
            enable_ui = lvim.builtin.dap.active,
          },
          indent_blankline = {
            enabled = lvim.builtin.indentlines.active,
            colored_indent_levels = false,
          },
          gitsigns = lvim.builtin.gitsigns.active,
          notify = lvim.user_plugins.edit.misc.notification.noice,
          nvimtree = true,
          neotree = lvim.builtin.tree_provider == "neo-tree",
          overseer = lvim.builtin.task_runner == "overseer",
          symbols_outline = lvim.builtin.tag_provider == "symbols-outline",
          which_key = lvim.builtin.which_key.active,
          leap = lvim.builtin.motion_provider == "leap",
          hop = lvim.builtin.motion_provider == "hop",
        },
        highlight_overrides = {
          mocha = {
            NormalFloat = { fg = "#CDD6F4", bg = "#151521" },
            CmpItemKindEnum = { fg = "#B4BEFE" },
            CmpItemKindEnumMember = { fg = "#F5C2E7" },
            CmpItemMenu = { fg = "#7F849C" },
            CmpItemAbbr = { fg = "#BAC2DE" },
            Cursor = { fg = "#1e1e2e", bg = "#d9e0ee" },
            ["@constant.builtin"] = { fg = "#EBA0AC" },
            TSConstBuiltin = { fg = "#EBA0AC" },
          },
        },
      }
      if lvim.transparent_window then
        local colors = require("catppuccin.palettes").get_palette()
        colors.none = "NONE"
        opts.custom_highlights = {
          Comment = { fg = colors.overlay1 },
          LineNr = { fg = colors.overlay1 },
          CursorLine = { bg = colors.none },
          CursorLineNr = { fg = colors.lavender },
          DiagnosticVirtualTextError = { bg = colors.none },
          DiagnosticVirtualTextWarn = { bg = colors.none },
          DiagnosticVirtualTextInfo = { bg = colors.none },
          DiagnosticVirtualTextHint = { bg = colors.none },
        }
      end
      catppuccin.setup(opts)
      vim.cmd([[colorscheme catppuccin]])
    end,
    cond = function()
      local _time = os.date("*t")
      return (_time.hour >= 17 and _time.hour < 21) and lvim.user_plugins.time_based_themes
    end,
  })
end
return M
