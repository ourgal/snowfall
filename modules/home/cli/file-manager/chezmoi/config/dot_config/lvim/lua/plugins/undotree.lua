return {
  "jiaoshijie/undotree",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("undotree").setup({
      window = {
        winblend = 0,
      },
    })
  end,
  keys = { { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>", desc = "UndoTree" } },
  enabled = lvim.user_plugins.edit.undo.tree.first,
}
