return {
  "liuchengxu/vim-clap",
  config = function()
    vim.g.clap_layout = { relative = "editor" }
    local create_aucmd = vim.api.nvim_create_autocmd
    vim.api.nvim_create_augroup("_lvim_user", {})
    create_aucmd("FileType", {
      group = "_lvim_user",
      pattern = { "clap_input" },
      command = "lua require('cmp').setup.buffer { sources = { { name = 'vim-dadbod-completion' } } }",
    })
  end,
  enabled = lvim.user_plugins.edit.search.clap,
}
