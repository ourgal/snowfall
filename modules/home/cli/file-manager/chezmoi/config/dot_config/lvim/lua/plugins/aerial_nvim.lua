return {
  "stevearc/aerial.nvim",
  cmd = "AerialToggle",
  opts = {
    layout = {
      min_width = 25,
    },
    close_on_select = true,
    show_guides = true,
  },
  keys = { { "<leader>o", "<cmd>AerialToggle<CR>", desc = "Outline" } },
  enabled = lvim.user_plugins.edit.outline.aerial,
}
