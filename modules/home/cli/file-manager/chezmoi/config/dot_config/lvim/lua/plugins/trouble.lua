return {
  "folke/trouble.nvim",
  cmd = "Trouble",
  event = "VeryLazy",
  opts = {
    auto_close = true,
  },
  keys = {
    { "<leader>rd", "<cmd>Trouble document_diagnostics<cr>", desc = "Diagnosticss" },
    { "<leader>rf", "<cmd>Trouble lsp_definitions<cr>", desc = "Definitions" },
    { "<leader>rl", "<cmd>Trouble loclist<cr>", desc = "LocationList" },
    { "<leader>rq", "<cmd>Trouble quickfix<cr>", desc = "QuickFix" },
    { "<leader>rr", "<cmd>Trouble lsp_references<cr>", desc = "References" },
    { "<leader>rt", "<cmd>TodoLocList <cr>", desc = "Todo" },
    { "<leader>rw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Diagnosticss" },
  },
  enabled = lvim.user_plugins.edit.lsp.diagnostics.dashbroad,
}
