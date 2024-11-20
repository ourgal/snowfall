return {
  "m-demare/hlargs.nvim",
  lazy = true,
  event = "VeryLazy",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = true,
  enabled = lvim.user_plugins.edit.treesitter.highlight,
}
