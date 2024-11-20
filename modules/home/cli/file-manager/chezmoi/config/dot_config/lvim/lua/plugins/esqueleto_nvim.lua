return {
  "z775729168/esqueleto.nvim",
  opts = {
    directories = { "~/.config/lvim/skeletons/" },
    patterns = { "README.md", "LICENSE", "python", "html" },
  },
  enabled = lvim.user_plugins.edit.template.new,
}
