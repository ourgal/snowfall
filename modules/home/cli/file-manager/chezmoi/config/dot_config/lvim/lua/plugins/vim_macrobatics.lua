return {
  "svermeulen/vim-macrobatics",
  dependencies = "junegunn/fzf.vim",
  lazy = false,
  keys = {
    { "q", "<plug>(Mac_Play)", silent = true },
    { "Q", "<plug>(Mac_RecordNew)", silent = true },
    { "[@", "<plug>(Mac_RotateBack)", desc = "Macro history back", silent = true },
    { "]@", "<plug>(Mac_RotateForward)", desc = "Macro history forward", silent = true },
    { "<leader>@n", "<plug>(Mac_NameCurrentMacro)", desc = "Name current macro", silent = true },
    { "<leader>@s", "<plug>(Mac_SearchForNamedMacroAndSelect)", desc = "Select macro", silent = true },
    { "<leader>@h", "<cmd>DisplayMacroHistory<cr>", desc = "Macro history", silent = true },
    { "<leader>@A", "<plug>(Mac_Append)", desc = "Macro append", silent = true },
    { "<leader>@I", "<plug>(Mac_Prepend)", desc = "Macro prepend", silent = true },
    { "<leader>@p", "<plug>(Mac_SearchForNamedMacroAndPlay)", desc = "Select macro and play", silent = true },
    { "<leader>@u", "<plug>(Mac_SearchForNamedMacroAndOverwrite)", desc = "Update macro", silent = true },
    { "<leader>@d", "<plug>(Mac_SearchForNamedMacroAndDelete)", desc = "Delete macro", silent = true },
    { "<leader>@r", "<plug>(Mac_SearchForNamedMacroAndRename)", desc = "Rename macro", silent = true },
  },
  enabled = lvim.user_plugins.edit.macro.macrobatics,
}