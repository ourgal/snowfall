return {
  "z775729168/nvim-puppeteer",
  dependencies = "nvim-treesitter/nvim-treesitter",
  lazy = false,
  enabled = lvim.user_plugins.language.python.string
    or lvim.user_plugins.language.lua.string
    or lvim.user_plugins.language.javascript.string,
}
