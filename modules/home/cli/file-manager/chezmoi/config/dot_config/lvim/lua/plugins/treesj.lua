return {
  "Wansmer/treesj",
  dependencies = { "nvim-treesitter" },
  config = function()
    require("treesj").setup({
      use_default_keymaps = false,
      notify = true,
    })
  end,
  keys = { { "<leader>:", "<cmd>TSJToggle<cr>", desc = "TSJToggle toggle" } },
  enabled = lvim.user_plugins.edit.jump.treesj,
}
