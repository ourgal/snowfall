return {
  "code-biscuits/nvim-biscuits",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  opts = {
    cursor_line_only = true,
  },
  init = function()
    vim.cmd("highlight default link BiscuitColor Comment")
  end,
  enabled = lvim.user_plugins.edit.treesitter.context.second,
}
