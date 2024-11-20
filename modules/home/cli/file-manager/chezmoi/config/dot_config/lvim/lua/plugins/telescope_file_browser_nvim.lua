return {
  "nvim-telescope/telescope-file-browser.nvim",
  init = function()
    require("telescope").load_extension("file_browser")
  end,
  enabled = lvim.user_plugins.edit.search.telescope.files,
}
