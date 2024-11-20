return {
  "p00f/nvim-ts-rainbow",
  init = function()
    lvim.builtin.treesitter.rainbow.enable = true
  end,
  enabled = lvim.user_plugins.edit.highlight.brackets.rainbow.second,
}
