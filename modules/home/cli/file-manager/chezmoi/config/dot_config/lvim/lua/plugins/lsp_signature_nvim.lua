return {
  "ray-x/lsp_signature.nvim",
  event = { "BufRead", "BufNew" },
  config = true,
  enabled = lvim.user_plugins.edit.lsp.hints.args,
}
