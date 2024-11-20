return {
  "weilbith/nvim-code-action-menu",
  cmd = "CodeActionMenu",
  init = function()
    local mappings = lvim.builtin.which_key.mappings["l"]
    mappings["a"] = nil
    lvim.builtin.which_key.mappings["l"] = mappings
  end,
  keys = {
    { "<leader>la", "<cmd>CodeActionMenu<CR>", desc = " Code Action" },
    { "<leader>a", "<cmd>CodeActionMenu<CR>", desc = " Code Action", mode = "v" },
  },
  enabled = lvim.user_plugins.edit.lsp.code_action.nenu,
}
