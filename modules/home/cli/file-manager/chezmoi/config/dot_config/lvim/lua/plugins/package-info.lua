return {
  "vuki656/package-info.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNew" },
  config = true,
  enabled = lvim.user_plugins.language.javascript.npm,
}
