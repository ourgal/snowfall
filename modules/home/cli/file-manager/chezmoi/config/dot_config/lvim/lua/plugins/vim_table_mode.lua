return {
  "dhruvasagar/vim-table-mode",
  config = function()
    vim.g.table_mode_map_prefix = "\t"
  end,
  enabled = lvim.user_plugins.language.markdown.table_mode,
}
