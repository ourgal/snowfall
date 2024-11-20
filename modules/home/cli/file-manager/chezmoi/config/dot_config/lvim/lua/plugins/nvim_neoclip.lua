return {
  "AckslD/nvim-neoclip.lua",
  dependencies = { { "kkharji/sqlite.lua", module = "sqlite" }, { "nvim-telescope/telescope.nvim" } },
  config = true,
  keys = {
    {
      "<leader>y",
      function()
        local opts = {
          winblend = 10,
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top",
            width = 0.8,
            height = 0.6,
            horizontal = { width = { padding = 0.15 } },
            vertical = { preview_height = 0.70 },
          },
          borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
          border = {},
          shorten_path = false,
        }
        local dropdown = require("telescope.themes").get_dropdown(opts)
        require("telescope").extensions.neoclip.default(dropdown)
      end,
      desc = "Neoclip",
    },
    {
      "<c-y>",
      function()
        local opts = {
          winblend = 10,
          layout_strategy = "flex",
          layout_config = {
            prompt_position = "top",
            width = 0.8,
            height = 0.6,
            horizontal = { width = { padding = 0.15 } },
            vertical = { preview_height = 0.70 },
          },
          borderchars = {
            prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
            results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
            preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
          },
          border = {},
          shorten_path = false,
        }
        local dropdown = require("telescope.themes").get_dropdown(opts)
        require("telescope").extensions.neoclip.default(dropdown)
      end,
      mode = "i",
    },
  },
  enabled = lvim.user_plugins.edit.yank.second,
}
