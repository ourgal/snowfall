return {
  "Gelio/cmp-natdat",
  dependencies = "hrsh7th/nvim-cmp",
  lazy = true,
  event = "InsertEnter",
  config = true,
  enabled = lvim.user_plugins.edit.completion.cmp.date,
}
