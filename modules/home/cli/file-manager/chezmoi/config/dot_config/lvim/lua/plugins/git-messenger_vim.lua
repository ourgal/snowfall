return {
  "rhysd/git-messenger.vim",
  cmd = "GitMessenger",
  init = function()
    vim.g.git_messenger_no_default_mappings = true
  end,
  keys = { { "<leader>gm", "<Plug>(git-messenger)", desc = "Git messenger" } },
  enabled = lvim.user_plugins.edit.git.messenger,
}
