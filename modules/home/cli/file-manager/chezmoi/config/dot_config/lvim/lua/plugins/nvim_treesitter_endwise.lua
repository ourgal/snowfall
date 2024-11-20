return {
  "RRethy/nvim-treesitter-endwise",
  ft = { "ruby", "lua", "vimscript", "bash", "elixir", "fish", "julia" },
  config = function()
    require("nvim-treesitter.configs").setup({
      endwise = {
        enable = true,
      },
    })
  end,
  enabled = lvim.user_plugins.edit.treesitter.endwise,
}
