-- Lazy.nvim
return {
  "TobinPalmer/Tip.nvim",
  dependencies = { "rcarriga/nvim-notify", "nvim-lua/plenary.nvim" },
  event = "VimEnter",
  init = function()
    require("tip").setup({
      seconds = 2,
      title = "Tip!",
      url = "https://vimiscool.tech/neotip",
    })
  end,
  enabled = lvim.user_plugins.edit.tips,
}
