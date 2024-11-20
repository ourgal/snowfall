return {
  "smjonas/live-command.nvim",
  config = function()
    require("live-command").setup({
      commands = {
        Norm = { cmd = "norm" },
      },
    })
  end,
  event = "CmdlineEnter",
  enabled = lvim.user_plugins.edit.cmd.norm,
}
