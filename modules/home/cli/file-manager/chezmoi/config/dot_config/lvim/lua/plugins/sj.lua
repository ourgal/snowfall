return {
  "woosaaahh/sj.nvim",
  config = true,
  keys = { {
    "s",
    function()
      require("sj").run()
    end,
  } },
  enabled = lvim.user_plugins.edit.jump.sj,
}
