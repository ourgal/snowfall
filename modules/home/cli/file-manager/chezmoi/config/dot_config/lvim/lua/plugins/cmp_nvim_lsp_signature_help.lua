return {
  "hrsh7th/cmp-nvim-lsp-signature-help",
  dependencies = "hrsh7th/nvim-cmp",
  lazy = true,
  event = "InsertEnter",
  enabled = lvim.user_plugins.edit.completion.cmp.signature,
}
