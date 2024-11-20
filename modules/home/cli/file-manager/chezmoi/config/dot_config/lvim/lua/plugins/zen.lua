local M = {}

M.hide_diagnostics = function()
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    local ns = vim.lsp.diagnostic.get_namespace(client.id)
    vim.diagnostic.hide(ns)
  end

  if vim.bo.filetype == "rust" then
    vim.cmd("RustDisableInlayHints")
  end
end

M.show_diagnostics = function()
  local clients = vim.lsp.get_clients()
  for _, client in ipairs(clients) do
    local ns = vim.lsp.diagnostic.get_namespace(client.id)
    vim.diagnostic.show(ns, nil, nil, require("configs.lsp").default_diagnostic_config)
  end

  if vim.bo.filetype == "rust" then
    vim.cmd("RustEnableInlayHints")
  end
end

M.config = function()
  table.insert(lvim.plugins, {
    "folke/zen-mode.nvim",
    lazy = true,
    cmd = "ZenMode",
    event = "BufRead",
    opts = {
      window = {
        backdrop = 1,
        height = 0.9, -- height of the Zen window
        width = 0.6,
        options = {
          signcolumn = "no", -- disable signcolumn
          number = false, -- disable number column
          relativenumber = false, -- disable relative numbers
        },
      },
      plugins = {
        gitsigns = { enabled = false }, -- disables git signs
        tmux = { enabled = true },
        twilight = { enabled = true },
        kitty = {
          enabled = false,
          font = "+2", -- font size increment
        },
      },
      on_open = function()
        vim.cmd([[
			       set foldlevel=10
			       lua require("plugins.zen").hide_diagnostics()
			       ]])
        if lvim.builtin.indentlines.active then
          vim.cmd("IndentBlanklineDisable!")
        end
      end,
      on_close = function()
        vim.cmd([[
			       set foldlevel=4
			       set foldmethod=expr
			       set foldexpr=nvim_treesitter#foldexpr()
			       lua require("plugins.zen").show_diagnostics()
			       ]])
        if lvim.builtin.indentlines.active then
          vim.cmd("IndentBlanklineEnable!")
        end
      end,
    },
    keys = { { "\\z", "<cmd>ZenMode<cr>", desc = " Zen" } },
    enabled = lvim.user_plugins.edit.zen.first,
  })
end

return M
