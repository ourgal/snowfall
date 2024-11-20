return {
  "filNaj/tree-setter",
  ft = { "c", "cpp", "go", "java", "javascript", "php", "python", "rust", "typescript" },
  init = function()
    lvim.builtin.treesitter.tree_setter = { enable = true }
  end,
  enabled = lvim.user_plugins.edit.treesitter.setter,
}
