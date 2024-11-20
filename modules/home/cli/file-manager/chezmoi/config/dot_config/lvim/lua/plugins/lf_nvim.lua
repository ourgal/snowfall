return {
  "lmburns/lf.nvim",
  dependencies = "akinsho/toggleterm.nvim",
  -- cmd = "Lf",
  opts = {
    height = vim.fn.float2nr(vim.fn.round(1.0 * vim.o.lines)),
    width = vim.fn.float2nr(vim.fn.round(1.0 * vim.o.columns)),
    default_file_manager = true, -- make lf default file manager
  },
  keys = { { "<leader>e", "<cmd>Lf<cr>", "Lf" } },
  enabled = lvim.user_plugins.edit.file_manager.lf.nvim,
}
