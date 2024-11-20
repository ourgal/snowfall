return {
  "antonk52/markdowny.nvim",
  ft = { "markdown" },
  config = true,
  keys = {
    {
      "<C-b>",
      function()
        require("markdowny").bold()
      end,
      mode = "v",
      buffer = 0,
    },
    {
      "<C-i>",
      function()
        require("markdowny").italic()
      end,
      mode = "v",
      buffer = 0,
    },
    {
      "<C-k>",
      function()
        require("markdowny").link()
      end,
      mode = "v",
      buffer = 0,
    },
    {
      "<C-e>",
      function()
        require("markdowny").code()
      end,
      mode = "v",
      buffer = 0,
    },
  },
  enabled = lvim.user_plugins.language.markdown.quick_edit,
}
