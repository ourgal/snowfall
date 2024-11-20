return {
  "luukvbaal/nnn.nvim",
  opts = {
    picker = {
      cmd = "tmux -f ~/.config/lvim/nnn.conf new -As nnn nnn -Pp",
      style = { border = "rounded" },
      session = "shared",
    },
    offset = true,
    replace_netrw = "picker",
  },
  keys = { { "<leader>n", "<cmd>NnnPicker<CR>", desc = "Nnn Picker" } },
  enabled = lvim.user_plugins.edit.file_manager.nnn,
}
