return {
  "anuvyklack/windows.nvim",
  dependencies = {
    "anuvyklack/middleclass",
    "anuvyklack/animation.nvim",
  },
  init = function()
    vim.o.winwidth = 15
    vim.o.winminwidth = 10
    vim.o.equalalways = false
  end,
  config = true,
  keys = {
    { "<c-w>z", "<cmd>WindowsMaximize<cr>" },
    { "<c-w>_", "<cmd>WindowsMaximizeVertically<cr>" },
    { "<c-w>|", "<cmd>WindowsMaximizeHorizontally<cr>" },
    { "<c-w>=", "<cmd>WindowsEqualize<cr>" },
  },
  enabled = lvim.user_plugins.edit.window.animation,
}
