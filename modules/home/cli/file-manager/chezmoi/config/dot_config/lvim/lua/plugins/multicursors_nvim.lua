return {
  "smoka7/multicursors.nvim",
  event = "VeryLazy",
  dependencies = {
    "smoka7/hydra.nvim",
  },
  cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
  config = true,
  keys = {
    {
      "\\m",
      "<cmd>MCstart<cr>",
      desc = "Multi Cursor",
      mode = { "v", "n" },
    },
  },
  enabled = lvim.user_plugins.edit.multicursor,
}
