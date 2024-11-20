return {
  "z775729168/diagflow.nvim",
  branch = "typos",
  opts = {
    enable = true,
    padding_top = 1,
    padding_left = 4,
    placement = "inline",
    inline_padding_left = 0,
    scope = "line",
    toggle_event = { "InsertEnter", "InsertLeave" },
    render_event = { "DiagnosticChanged", "BufEnter", "CursorMoved", "TextChanged", "BufWritePost" },
    update_event = { "DiagnosticChanged", "BufReadPost", "BufEnter", "CursorMoved", "TextChanged", "BufWritePost" },
  },
  enabled = lvim.user_plugins.edit.lsp.diagnostics.inline,
}
