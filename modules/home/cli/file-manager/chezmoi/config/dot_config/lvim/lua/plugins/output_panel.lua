return {
  "z775729168/output-panel.nvim",
  event = "VeryLazy",
  config = true,
  cmd = "OutputPanel",
  keys = { { "<leader>lL", "<cmd>OutputPanel<cr>", desc = "LSP output" } },
  enabled = lvim.user_plugins.edit.lsp.output,
}
