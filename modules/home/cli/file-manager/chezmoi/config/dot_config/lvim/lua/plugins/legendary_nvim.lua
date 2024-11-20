return {
  "mrjones2014/legendary.nvim",
  config = true,
  keys = { { "<leader>C", "<cmd>lua require('legendary').find('commands')<cr>", desc = " Command Palette" } },
  enabled = lvim.user_plugins.edit.search.legendary,
}
