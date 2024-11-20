return {
  "ellisonleao/carbon-now.nvim",
  config = true,
  cmd = "CarbonNow",
  keys = {
    { "<leader>,sc", "<cmd>CarbonNow<cr>", desc = "Carbon" },
    { "<leader>,sc", ":'<,'>CarbonNow<cr>", desc = "Carbon", mode = "v", silent = true },
  },
  enabled = lvim.user_plugins.edit.share.carbon.nvim,
}
