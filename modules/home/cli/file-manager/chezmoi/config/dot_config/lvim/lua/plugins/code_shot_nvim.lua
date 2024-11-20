return {
  "niuiic/code-shot.nvim",
  dependencies = "niuiic/core.nvim",
  config = true,
  keys = {
    {
      "<leader>Ss",
      function()
        require("code-shot").shot()
      end,
      desc = "Take a picture",
      mode = { "n", "v" },
    },
  },
  enabled = lvim.user_plugins.edit.share.shot,
}
