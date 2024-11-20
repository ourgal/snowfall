return {
  "nvim-telescope/telescope-media-files.nvim",
  dependencies = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim", "nvim-telescope/telescope.nvim" },
  init = function()
    require("telescope").load_extension("media_files")
  end,
  keys = { { "<leader>sm", "<cmd>Telescope media_files<cr>", desc = "Media Files" } },
  enabled = lvim.user_plugins.edit.search.telescope.media,
}
