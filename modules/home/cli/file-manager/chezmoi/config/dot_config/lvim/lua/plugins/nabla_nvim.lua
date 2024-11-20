return {
  "jbyuki/nabla.nvim",
  keys = { {
    "<leader>x",
    function()
      require("nabla").popup()
    end,
  } },
  enabled = lvim.user_plugins.language.latex,
}
