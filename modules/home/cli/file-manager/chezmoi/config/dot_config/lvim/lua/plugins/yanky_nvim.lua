return {
  "gbprod/yanky.nvim",
  config = true,
  keys = {
    { "p", "<Plug>(YankyPutAfter)", mode = { "n", "x" } },
    { "P", "<Plug>(YankyPutBefore)", mode = { "n", "x" } },
    { "<c-n>", "<Plug>(YankyCycleForward)" },
    { "<c-p>", "<Plug>(YankyCycleBackward)" },
    {
      "<leader>si",
      "<cmd>lua require('telescope').extensions.yank_history.yank_history()<cr>",
      desc = "Yank History",
    },
  },
  enabled = lvim.user_plugins.edit.yank.first,
}
