return {
  "mizlan/iswap.nvim",
  event = "BufRead",
  keys = {
    { "rn", "<cmd>ISwap<cr>", desc = "Node swap" },
    -- { "<A-,>", "<cmd>ISwapNodeWithLeft<cr>" },
    -- { "<A-.>", "<cmd>ISwapNodeWithRight<cr>" },
  },
  config = true,
  enabled = lvim.user_plugins.edit.swap.node,
}
