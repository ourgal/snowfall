return {
  "chrisgrieser/nvim-various-textobjs",
  lazy = false,
  opts = { useDefaultKeymaps = true }, -- TODO conflict with mini.replace motion
  enabled = lvim.user_plugins.edit.treesitter.textobj.first,
}
