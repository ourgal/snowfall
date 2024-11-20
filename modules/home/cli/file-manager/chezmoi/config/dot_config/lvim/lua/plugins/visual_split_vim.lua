return {
  "wellle/visual-split.vim",
  keys = {
    { "<c-w>gr", "<Plug>(Visual-Split-Resize)", desc = "Visual-Split-Resize" },
    { "<c-w>gss", "<Plug>(Visual-Split-Split)", desc = "Visual-Split-Split" },
    { "<c-w>gsa", "<Plug>(Visual-Split-SplitAbove)", desc = "Visual-Split-SplitAbove" },
    { "<c-w>gsb", "<Plug>(Visual-Split-SplitBelow)", desc = "Visual-Split-SplitBelow" },
    { "<c-w>gr", "<Plug>(Visual-Split-VSResize)", desc = "Visual-Split-Resize", mode = "x" },
    { "<c-w>gss", "<Plug>(Visual-Split-VSSplit)", desc = "Visual-Split-Split", mode = "x" },
    { "<c-w>gsa", "<Plug>(Visual-Split-VSSplitAbove)", desc = "Visual-Split-SplitAbove", mode = "x" },
    { "<c-w>gsb", "<Plug>(Visual-Split-VSSplitBelow)", desc = "Visual-Split-SplitBelow", mode = "x" },
  },
  enabled = lvim.user_plugins.edit.window.visual_split,
}
