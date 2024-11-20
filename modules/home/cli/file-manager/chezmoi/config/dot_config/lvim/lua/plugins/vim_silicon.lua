return {
  "segeljakt/vim-silicon",
  cmd = "Silicon",
  keys = {
    { "<leader>,ss", "<cmd>Silicon<cr>", desc = "Silicon" },
    { "<leader>,ss", ":'<,'>Silicon<cr>", desc = "Silicon", mode = "v", silent = true },
  },
  enabled = lvim.user_plugins.edit.share.silicon,
}
