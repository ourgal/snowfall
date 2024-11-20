return {
  "willothy/moveline.nvim",
  build = "make",
  keys = {
    {
      "<a-k>",
      function()
        require("moveline").up()
      end,
    },
    {
      "<a-j>",
      function()
        require("moveline").down()
      end,
    },
    {
      "<a-k>",
      function()
        require("moveline").block_up()
      end,
      mode = "v",
    },
    {
      "<a-j>",
      function()
        require("moveline").block_down()
      end,
      mode = "v",
    },
  },
  enabled = lvim.user_plugins.edit.moveline.second,
}
