return {
  "yaocccc/nvim-hl-mdcodeblock.lua",
  config = function()
    require("hl-mdcodeblock").setup()
    vim.cmd("highlight MDCodeBlock guibg=#000022")
  end,
  ft = { "markdown" },
  enabled = lvim.user_plugins.language.markdown.hl_code.first,
}
