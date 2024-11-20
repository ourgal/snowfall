return {
  url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
  lazy = true,
  event = "BufRead",
  init = function()
    vim.diagnostic.config({ virtual_lines = false })
  end,
  config = true,
  keys = {
    {
      "\\\\",
      function()
        require("lsp_lines").toggle()
      end,
      desc = "󰓽 LSP Lines",
    },
  },
  enabled = lvim.user_plugins.edit.lsp.diagnostics.underline,
}
