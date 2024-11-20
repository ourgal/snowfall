return {
  "jakewvincent/mkdnflow.nvim",
  config = function()
    require("mkdnflow").setup({
      mappings = {
        MkdnUpdateNumbering = false,
        MkdnTableNewRowBelow = false,
        MkdnTableNewRowAbove = false,
        MkdnTableNewColAfter = false,
        MkdnTableNewColBefore = false,
        MkdnFoldSection = false,
        MkdnUnfoldSection = false,
      },
      tabless = {
        trim_whitespace = true,
      },
    })
  end,
  ft = { "markdown" },
  enabled = lvim.user_plugins.language.markdown.support,
}
