return {
  "z775729168/marks.nvim",
  event = "BufRead",
  opts = {
    default_mappings = false,
    force_write_shada = true,
  },
  keys = {
    {
      "m ",
      function()
        require("marks").toggle()
      end,
      desc = "Toggle mark",
    },
    {
      "m.",
      function()
        require("marks").next()
      end,
      desc = "Next mark",
    },
    {
      "m,",
      function()
        require("marks").prev()
      end,
      desc = "Prev mark",
    },
    {
      "m<Del>",
      function()
        require("marks").delete_buf()
      end,
      desc = "Delete buffer marks",
    },
  },
  enabled = lvim.user_plugins.edit.mark.marks,
}
