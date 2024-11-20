return {
  "iamcco/markdown-preview.nvim",
  ft = { "markdown" },
  build = "cd app && yarn install",
  init = function()
    vim.g.mkdp_filetypes = { "markdown" }
  end,
  keys = { { "\\M", "<cmd>MarkdownPreviewToggle<CR>", desc = "Markdown Preview" } },
  enabled = lvim.user_plugins.language.markdown.preview_web.first,
}
