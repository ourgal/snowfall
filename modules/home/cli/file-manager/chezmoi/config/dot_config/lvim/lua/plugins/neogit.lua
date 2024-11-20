return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim", -- required
    "nvim-telescope/telescope.nvim", -- optional
    "sindrets/diffview.nvim", -- optional
    "ibhagwan/fzf-lua", -- optional
  },
  keys = { {
    "<leader>gn",
    function()
      require("neogit").open()
    end,
    desc = "Neogit",
  } },
  config = true,
  enabled = lvim.user_plugins.edit.git.neogit,
}
