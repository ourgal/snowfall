return {
  "stevanmilic/nvim-lspimport",
  keys = {
    {
      "<leader>l.",
      function()
        require("lspimport").import()
      end,
      desc = "Import",
    },
  },
  enabled = lvim.user_plugins.edit.lsp.import,
}
