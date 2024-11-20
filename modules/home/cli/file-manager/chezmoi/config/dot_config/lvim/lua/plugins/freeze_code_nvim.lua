return {
  "AlejandroSuero/freeze-code.nvim",
  cmd = { "Freeze" },
  config = true,
  keys = {
    { "<leader>,sf", "<cmd>Freeze<cr>", mode = "n", desc = "Freeze" },
    {
      "<leader>,sf",
      function()
        local status_ok, freeze = pcall(require, "freeze-code")
        if not status_ok then
          return
        end
        freeze.freeze(vim.fn.line("'<"), vim.fn.line("'>"))
      end,
      mode = "v",
      desc = "Freeze",
    },
  },
  enabled = lvim.user_plugins.edit.share.freeze,
}
