return {
  "gbprod/substitute.nvim",
  config = function()
    require("substitute").setup({
      on_substitute = require("yanky.integration").substitute(),
      yank_substituted_text = false,
      highlight_substituted_text = {
        enabled = true,
        timer = 500,
      },
      range = {
        prefix = "",
        prompt_current_text = false,
        confirm = false,
        complete_word = false,
        motion1 = false,
        motion2 = false,
        suffix = "",
      },
      exchange = {
        motion = false,
        use_esc_to_cancel = true,
      },
    })
  end,
  keys = {
    {
      "<leader>x",
      function()
        require("substitute").operator()
      end,
      desc = "Substitute",
    },
    {
      "<leader>x",
      function()
        require("substitute").visual()
      end,
      mode = { "x" },
      desc = "Substitute",
    },
    {
      "<leader>X",
      function()
        require("substitute.exchange").visual()
      end,
      mode = { "x" },
      desc = "Exchange",
    },
  },
  enabled = lvim.user_plugins.edit.substitute,
}
