return {
  "chrisgrieser/nvim-alt-substitute",
  opts = true,
  -- lazy-loading with `cmd =` does not work well with incremental preview
  event = "CmdlineEnter",
  enabled = lvim.user_plugins.edit.cmd.sub,
}
