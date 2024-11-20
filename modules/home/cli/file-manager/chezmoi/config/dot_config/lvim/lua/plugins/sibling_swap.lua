return {
  "Wansmer/sibling-swap.nvim",
  dependencies = "nvim-treesitter",
  event = "BufRead",
  opts = { allow_interline_swaps = true },
  keys = {
    {
      "<leader><",
      function()
        require("sibling-swap").swap_with_left()
      end,
      desc = "swap with left",
    },
    {
      "<leader>>",
      function()
        require("sibling-swap").swap_with_right()
      end,
      desc = "swap with right",
    },
  },
  enabled = lvim.user_plugins.edit.treesitter.swap.sibling,
}
