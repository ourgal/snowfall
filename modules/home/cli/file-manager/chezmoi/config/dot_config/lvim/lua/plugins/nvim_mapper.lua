return {
  "gregorias/nvim-mapper",
  dependencies = { "nvim-telescope/telescope.nvim" },
  init = function()
    require("telescope").load_extension("mapper")
  end,
  enabled = lvim.user_plugins.edit.search.telescope.mapper,
}
