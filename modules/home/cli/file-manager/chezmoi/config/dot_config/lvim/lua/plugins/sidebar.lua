return {
  "sidebar-nvim/sidebar.nvim",
  opts = {
    open = false,
    initial_width = 30,
    enable_profile = false,
    sections = { "datetime", "git", "diagnostics", "containers" },
    datetime = {
      icon = "󰃰 ",
      format = "%a %b %d, %H:%M",
      clocks = {
        { name = "local" },
      },
    },
    todos = {
      icon = " ",
      ignored_paths = { "~" }, -- ignore certain paths, this will prevent huge folders like $HOME to hog Neovim with TODO searching
      initially_closed = false, -- whether the groups should be initially closed on start. You can manually open/close groups later.
    },
  },
  keys = {
    {
      "<leader>Q",
      function()
        require("sidebar-nvim").toggle()
      end,
      desc = "SideBar",
    },
  },
  event = "VeryLazy",
  enabled = lvim.user_plugins.edit.dashboard.sidebar,
}
