return {
  "danymat/neogen",
  cmd = "Neogen",
  config = function()
    require("neogen").setup({ snippet_engine = "luasnip" })
  end,
  -- event = "InsertEnter",
  dependencies = "nvim-treesitter/nvim-treesitter",
  keys = {
    {
      "<leader>n",
      function()
        require("neogen").generate()
      end,
      desc = " Neogen",
    },
  },
  enabled = lvim.user_plugins.edit.doc.generator.first,
}
