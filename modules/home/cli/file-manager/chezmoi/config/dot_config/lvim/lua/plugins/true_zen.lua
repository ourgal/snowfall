return {
  "Pocco81/true-zen.nvim",
  opts = {
    integrations = { tmux = true, twilight = true, lualine = true },
  },
  keys = { {
    "\\z",
    function()
      require("true-zen.ataraxis").toggle()
    end,
  } },
  enabled = lvim.user_plugins.edit.zen.second,
}
