return {
  "simrat39/symbols-outline.nvim",
  cmd = "SymbolsOutline",
  opts = {
    auto_close = true,
  },
  keys = { { "<leader>po", "<cmd>SymbolsOutline<cr>", desc = " Symbol Outline" } },
  enabled = lvim.user_plugins.edit.outline.symbol,
}
