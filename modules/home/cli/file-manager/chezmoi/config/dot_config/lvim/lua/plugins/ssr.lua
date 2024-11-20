return {
  "cshuaimin/ssr.nvim",
  lazy = true,
  event = { "BufReadPost", "BufNew" },
  opts = {
    min_width = 50,
    min_height = 5,
    max_width = 120,
    max_height = 25,
    keymaps = {
      close = "q",
      next_match = "n",
      prev_match = "N",
      replace_confirm = "<cr>",
      replace_all = "<leader><cr>",
    },
  },
  keys = {
    {
      "<leader>RS",
      function()
        require("ssr").open()
      end,
      desc = "Structural search and replace",
    },
  },
  enabled = lvim.user_plugins.edit.replace.ssr,
}
