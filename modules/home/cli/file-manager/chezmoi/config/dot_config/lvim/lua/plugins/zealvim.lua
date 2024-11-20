return {
  "KabbAmine/zeavim.vim",
  cmd = { "Zeavim", "ZeavimV" },
  init = function()
    vim.g.zv_file_types = {
      scss = "sass",
      sh = "bash",
      tex = "latex",
      ["yaml.ansible"] = "ansible",
    }
  end,
  keys = {
    { "<leader>z", "<Plug>Zeavim", desc = "Zeal" },
    { "<leader>z", "<Plug>ZVVisSelection", mode = "v", desc = "Zeal" },
    { "g?", "<Plug>ZVOperator", desc = "Zeal" },
  },
  enabled = lvim.user_plugins.edit.doc.zeal,
}
