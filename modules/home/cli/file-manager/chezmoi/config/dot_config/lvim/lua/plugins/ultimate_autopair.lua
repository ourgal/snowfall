return {
  "altermo/ultimate-autopair.nvim",
  branch = "v0.6",
  event = { "InsertEnter", "CmdlineEnter" },
  opts = {
    space2 = { enable = true },
    tabout = { enable = true },
    close = { enable = true },
    fastwarp = {
      multi = true,
      p = 20, --all sub-configs get default value p=20, unless specified
      { map = "<A-e>", nocursormove = true },
      { map = "<A-f>", nocursormove = false },
    },
  },
  enabled = lvim.user_plugins.edit.autopair.ultimate,
}
