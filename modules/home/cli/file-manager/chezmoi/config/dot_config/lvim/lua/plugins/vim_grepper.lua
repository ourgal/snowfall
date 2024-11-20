return {
  "mhinz/vim-grepper",
  cmd = { "Grepper", "GrepperGit", "GrepperAg", "GrepperRg" },
  keys = { { "g/", "<plug>(GrepperOperator)", mode = { "n", "x" } } },
  enabled = lvim.user_plugins.edit.search.motion,
}
