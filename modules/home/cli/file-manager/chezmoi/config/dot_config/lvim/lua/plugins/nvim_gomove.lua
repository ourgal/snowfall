return {
  "booperlv/nvim-gomove",
  keys = {
    { "<A-k>", "<Plug>GoNSMUp" },
    { "<A-j>", "<Plug>GoNSMDown" },
    { "<A-k>", "<Plug>GoVSMUp", mode = "v" },
    { "<A-j>", "<Plug>GoVSMDown", mode = "v" },
  },
  enabled = lvim.user_plugins.edit.moveline.first,
}
