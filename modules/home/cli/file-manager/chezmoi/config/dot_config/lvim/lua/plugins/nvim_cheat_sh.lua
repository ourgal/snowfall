return {
  "RishabhRD/nvim-cheat.sh",
  dependencies = "RishabhRD/popfix",
  -- config = function()
  -- 	vim.g.cheat_default_window_layout = "vertical_split"
  -- end,
  lazy = true,
  cmd = { "Cheat", "CheatWithoutComments", "CheatList", "CheatListWithoutComments" },
  keys = { { "<leader>?", "<cmd>Cheat<CR>", desc = " Cheat.sh" } },
  enabled = lvim.user_plugins.edit.doc.cheat,
}
