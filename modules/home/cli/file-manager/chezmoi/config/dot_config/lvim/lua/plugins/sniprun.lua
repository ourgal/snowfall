return {
  "michaelb/sniprun",
  branch = "master",
  build = "sh install.sh",
  opts = {
    display = {
      "VirtualTextOk", --# display ok results as virtual text (multiline is shortened)
    },
    live_mode_toggle = "enable",
  },
  cmd = { "SnipRun", "SnipInfo", "SnipLive", "SnipClose", "SnipReset", "SnipReplMemoryClean" },
  keys = {
    {
      "<leader>.",
      ":'<,'>SnipRun<cr>",
      mode = "v",
      desc = "Run code",
      silent = true,
    },
  },
  enabled = lvim.user_plugins.edit.runner,
}
