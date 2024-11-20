local opts = {
  settings = {
    exportPdf = "onSave", -- Choose onType, onSave or never.
    -- serverPath = "" -- Normally, there is no need to uncomment it.
  },
}
require("lvim.lsp.manager").setup("typst_lsp", opts)
