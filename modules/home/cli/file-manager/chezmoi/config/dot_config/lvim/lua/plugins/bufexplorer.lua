return {
  "jlanzarotta/bufexplorer",
  keys = {
    {
      "<leader>be",
      "<cmd>BufExplorer<cr>",
      desc = "Explorer",
    },
    {
      "<leader>bt",
      "<cmd>ToggleBufExplorer<cr>",
      desc = "Toggle explorer",
    },
    {
      "<leader>bs",
      "<cmd>BufExplorerHorizontalSplit<cr>",
      desc = "Explorer split",
    },
    {
      "<leader>bv",
      "<cmd>BufExplorerVerticalSplit<cr>",
      desc = "Explorer vsplit",
    },
  },
  enabled = lvim.user_plugins.edit.buffer.explorer,
}
