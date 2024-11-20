return {
  "whleucka/reverb.nvim",
  event = "BufReadPre",
  opts = { sounds = { CursorMovedI = "/home/zxc/.config/lvim/sounds/" .. "click.ogg" } },
  enabled = lvim.user_plugins.edit.sound,
}
