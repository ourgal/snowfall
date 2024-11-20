return {
  "rktjmp/paperplanes.nvim",
  config = true,
  keys = { { "<leader>Sp", "<cmd>PP<cr>", desc = "Pastebin", mode = { "n", "v" } } },
  enabled = lvim.user_plugins.edit.share.pastebin,
}
