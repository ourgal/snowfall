return {
  "bennypowers/nvim-regexplainer",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  opts = { auto = true },
  ft = { "html", "js", "cjs", "mjs", "ts", "jsx", "tsx", "cjsx", "mjsx" },
  enabled = lvim.user_plugins.edit.treesitter.regex,
}
