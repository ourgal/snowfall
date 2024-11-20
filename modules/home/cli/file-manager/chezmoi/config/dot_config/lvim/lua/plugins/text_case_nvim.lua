return {
  "johmsalas/text-case.nvim",
  config = function()
    require("textcase").setup()
    require("telescope").load_extension("textcase")
  end,
  keys = {
    { "rt", "<cmd>TextCaseOpenTelescopeQuickChange<CR>", desc = "Text case change" },
    { "rT", "<cmd>TextCaseOpenTelescopeLSPChange<CR>", desc = "Text case change with lsp" },
  },
  enabled = lvim.user_plugins.edit.text_case,
}
