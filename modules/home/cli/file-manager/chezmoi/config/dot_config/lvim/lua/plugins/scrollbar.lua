return {
  "petertriho/nvim-scrollbar",
  config = function()
    require("scrollbar").setup({
      show_in_active_only = true,
      hide_if_all_visible = true, -- Hides everything if all lines are visible
      handlers = {
        cursor = true,
        diagnostic = true,
        gitsigns = true, -- Requires gitsigns
        handle = true,
        search = true, -- Requires hlslens
      },
    })
    lvim.builtin.gitsigns.on_config_done = function()
      require("scrollbar.handlers.gitsigns").setup()
    end
    require("scrollbar.handlers.search").setup()
  end,
  enabled = lvim.user_plugins.edit.scrollbar.scrollbar,
}
