return {
  "m-demare/attempt.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
  },
  init = function()
    require("telescope").load_extension("attempt")
  end,
  config = true,
  enabled = lvim.user_plugins.edit.attempt,
}
