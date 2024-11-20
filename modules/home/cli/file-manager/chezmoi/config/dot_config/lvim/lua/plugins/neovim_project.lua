return {
  "coffebar/neovim-project",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope.nvim", tag = "0.1.4" },
    { "Shatur/neovim-session-manager" },
  },
  init = function()
    -- enable saving the state of plugins in the session
    vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  end,
  opts = {
    opts = {
      projects = { -- define project roots
        "~/workspace/*",
        "~/.config/*",
      },
    },
  },
  lazy = false,
  priority = 100,
  enabled = lvim.user_plugins.edit.session.manager,
}
