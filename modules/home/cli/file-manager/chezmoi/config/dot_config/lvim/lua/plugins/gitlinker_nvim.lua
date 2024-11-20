return {
  "linrongbin16/gitlinker.nvim",
  cmd = "GitLink",
  config = true,
  keys = { { "<leader>gL", "<cmd>GitLink<cr>", mode = { "n", "v" }, desc = "Copy git permlink to clipboard" } },
  enabled = lvim.user_plugins.edit.git.link,
}
