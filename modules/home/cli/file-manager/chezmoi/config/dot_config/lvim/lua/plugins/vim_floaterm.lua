return {
  "voldikss/vim-floaterm",
  cmd = { "FloatermNew", "FloatermToggle" },
  init = function()
    vim.g.floaterm_opener = "edit"
    vim.g.floaterm_height = 0.999
    vim.g.floaterm_width = 0.99
    vim.g.floaterm_shell = "$SHELL"
    if lvim.user_plugins.edit.file_manager.broot.vim then
      lvim.builtin.which_key.mappings["f"] = { "<cmd>FloatermNew broot<cr>", "Broot" }
    end
    if lvim.user_plugins.edit.file_manager.lf.vim then
      lvim.builtin.which_key.mappings["e"] = { "<cmd>FloatermNew lf<cr>", "Lf" }
    end
  end,
  keys = {
    { "<F12>", "<cmd>FloatermToggle<cr>", "FloatermToggle" },
    { "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", mode = "t", silent = true },
  },
  enabled = lvim.user_plugins.edit.file_manager.lf.vim
    or lvim.user_plugins.edit.file_manager.broot.vim
    or lvim.user_plugins.edit.terminal,
}
