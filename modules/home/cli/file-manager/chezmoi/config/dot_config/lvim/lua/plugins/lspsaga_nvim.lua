return {
  "glepnir/lspsaga.nvim",
  event = "LspAttach",
  dependencies = {
    { "nvim-tree/nvim-web-devicons" },
    --Please make sure you install markdown and markdown_inline parser
    { "nvim-treesitter/nvim-treesitter" },
  },
  opts = { lightbulb = { enable = false }, symbol_in_winbar = { enable = false } },
  keys = {
    { "gpd", "<cmd>Lspsaga peek_definition<CR>", desc = "Peek definition" },
    { "K", "<cmd>Lspsaga hover_doc<CR>", desc = "Show Documentation" },
  },
  enabled = lvim.user_plugins.edit.lsp.enhance,
}
