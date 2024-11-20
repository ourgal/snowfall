return {
  "smjonas/inc-rename.nvim",
  cmd = "IncRename",
  config = true,
  init = function()
    local mappings = lvim.builtin.which_key.mappings["l"]
    mappings["r"] = {}
    mappings["R"] = {}
    lvim.builtin.which_key.mappings["l"] = mappings
  end,
  keys = {
    { "rL", ":IncRename ", desc = "Rename", silent = true },
    {
      "rl",
      function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end,
      desc = "Rename keep",
      expr = true,
      silent = true,
    },
  },
  enabled = lvim.user_plugins.edit.lsp.rename,
}
