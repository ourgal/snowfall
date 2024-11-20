return {
  "is0n/fm-nvim",
  opts = {
    -- mappings = {
    -- 	ESC = ":q<CR>",
    -- },
    -- UI Options
    ui = {
      -- Default UI (can be "split" or "float")
      default = "float",

      float = {
        -- Floating window border (see ':h nvim_open_win')
        border = "none",

        -- Highlight group for floating window/border (see ':h winhl')
        float_hl = "Normal",
        border_hl = "FloatBorder",

        -- Floating Window Transparency (see ':h winblend')
        blend = 0,

        -- Num from 0 - 1 for measurements
        height = 1.0,
        width = 1.0,

        -- X and Y Axis of Window
        x = 0.5,
        y = 0.5,
      },

      split = {
        -- Direction of split
        direction = "topleft",

        -- Size of split
        size = 24,
      },
    },
  },
  keys = { { "<leader>e", "<cmd>Lf<cr>", "Lf" } },
  enabled = lvim.user_plugins.edit.file_manager.terminal,
}
