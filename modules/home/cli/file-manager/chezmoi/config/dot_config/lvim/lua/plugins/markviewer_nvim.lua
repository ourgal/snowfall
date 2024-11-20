return {
  "FelipeIzolan/markviewer.nvim",
  ft = { "markdown" },
  config = true,
  keys = { { "\\V", "<cmd>MarkViewer<CR>", desc = "Markdown Viewer" } },
  enabled = lvim.user_plugins.language.markdown.preview_web.second,
}
