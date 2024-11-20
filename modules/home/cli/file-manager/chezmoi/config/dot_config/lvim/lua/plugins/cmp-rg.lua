return {
  "lukas-reineke/cmp-rg",
  dependencies = "hrsh7th/nvim-cmp",
  lazy = true,
  event = "InsertEnter",
  enabled = lvim.user_plugins.edit.completion.cmp.grep,
}
