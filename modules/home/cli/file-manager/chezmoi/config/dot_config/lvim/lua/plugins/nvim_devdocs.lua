return {
  "z775729168/nvim-devdocs",
  branch = "detect_version",
  cmd = "DevdocsOpenCurrent",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  config = true,
  keys = { { "<leader>h", "<cmd>DevdocsOpenCurrent<cr>", desc = "Docs" } },
  enabled = lvim.user_plugins.edit.doc.devdocs,
}
