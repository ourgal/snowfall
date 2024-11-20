return {
  "tpope/vim-fugitive",
  cmd = { "G", "Git" },
  keys = { { "<leader>gf", "<cmd>G<cr>", desc = "Fugitive" } },
  enabled = lvim.user_plugins.edit.git.fugitive,
}
