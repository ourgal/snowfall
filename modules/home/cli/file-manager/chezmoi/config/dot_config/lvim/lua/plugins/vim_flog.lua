return {
  "rbong/vim-flog",
  lazy = true,
  cmd = { "Flog", "Flogsplit", "Floggit" },
  dependencies = {
    "tpope/vim-fugitive",
    cmd = "Git",
  },
  keys = { { "<leader>gB", "<cmd>Flog<cr>", desc = "Git branch viewer" } },
  enabled = lvim.user_plugins.edit.git.branch_viewer,
}
