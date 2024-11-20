return {
  "cbochs/grapple.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    {
      "<leader>m ",
      function()
        require("grapple").toggle()
      end,
      desc = "Grapple Toggle",
    },
    {
      "<leader>ml",
      function()
        require("grapple").popup_tags()
      end,
      desc = "Grapple List",
    },
    {
      "<leader>m,",
      function()
        require("grapple").cycle_backward()
      end,
      desc = "Grapple baackward",
    },
    {
      "<leader>m.",
      function()
        require("grapple").cycle_forward()
      end,
      desc = "Grapple forward",
    },
    {
      "<leader>mD",
      function()
        require("grapple").reset()
      end,
      desc = "Grapple Reset",
    },
  },
  enabled = lvim.user_plugins.edit.navigation.grapple,
}
