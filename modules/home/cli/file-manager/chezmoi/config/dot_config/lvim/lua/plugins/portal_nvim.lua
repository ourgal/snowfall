return {
  "cbochs/portal.nvim",
  keys = {
    { "<leader><", "<cmd>Portal jumplist backward<cr>", desc = "Jump back" },
    { "<leader>>", "<cmd>Portal jumplist forward<cr>", desc = "Jump forward" },
  },
  cmd = "Portal",
  enabled = lvim.user_plugins.edit.jumplist,
}
