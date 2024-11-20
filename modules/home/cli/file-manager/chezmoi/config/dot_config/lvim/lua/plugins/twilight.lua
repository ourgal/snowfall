return {
  "folke/twilight.nvim",
  lazy = true,
  event = "BufRead",
  opts = {
    dimming = {
      alpha = 0.25, -- amount of dimming
      color = { "Normal", "#ffffff" },
    },
    context = 15,
    expand = {
      "function",
      "method",
      "table",
      "if_statement",
    },
    exclude = {},
  },
  keys = { { "\\T", "<cmd>Twilight<cr>", desc = "Twilight" } },
  enabled = lvim.user_plugins.edit.dim.first,
}
