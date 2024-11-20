return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen", "DiffviewFileHistory" },
  dependencies = "nvim-lua/plenary.nvim",
  config = true,
  keys = { { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "diffview: File History" } },
  enabled = lvim.user_plugins.edit.git.diff,
}
