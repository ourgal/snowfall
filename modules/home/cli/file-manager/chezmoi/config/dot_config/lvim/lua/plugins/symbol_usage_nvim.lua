return {
  "Wansmer/symbol-usage.nvim",
  event = "LspAttach",
  opts = { vt_position = "end_of_line" },
  enabled = lvim.user_plugins.edit.lsp.reference.symbol,
}
