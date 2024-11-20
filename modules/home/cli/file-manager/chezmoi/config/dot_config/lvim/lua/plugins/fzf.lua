return {
  "junegunn/fzf",
  build = function()
    vim.fn["fzf#install"]()
  end,
  enabled = lvim.user_plugins.edit.search.fzf,
}
