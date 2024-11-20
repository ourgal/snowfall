return {
  "MeanderingProgrammer/markdown.nvim",
  name = "render-markdown", -- Only needed if you have another plugin named markdown.nvim
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("render-markdown").setup({})
  end,
  ft = { "markdown" },
  enabled = lvim.user_plugins.language.markdown.better_view,
}
