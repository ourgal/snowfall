return {
  "uga-rosa/translate.nvim",
  keys = {
    { "<leader>Ee", "viw<cmd>Translate EN -output=floating<CR><ESC>b", desc = "English" },
    { "<leader>Ee", "cmd>Translate EN -output=floating<CR><ESC>", desc = "English", mode = { "v" } },
    {
      "<leader>EE",
      "<cmd>Translate EN -output=replace<CR><ESC>",
      desc = "English replace",
      mode = { "n", "v" },
    },
    { "<leader>Ez", "viw<cmd>Translate ZH -output=floating<CR><ESC>b", desc = "Chinese" },
    { "<leader>Ez", "<cmd>Translate ZH -output=floating<CR><ESC>", desc = "Chinese", mode = { "v" } },
    {
      "<leader>EZ",
      "<cmd>Translate ZH -output=replace<CR><ESC>",
      desc = "Chinses replace",
      mode = { "n", "v" },
    },
  },
  cmd = "Translate",
  enabled = lvim.user_plugins.edit.translate,
}
