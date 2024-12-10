local M = {}

M.set_terminal_keymaps = function()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

M.other = function()
  require("configs.update_packages").config()

  lvim.builtin.which_key.mappings[","] = {
    name = "Others",
    ["s"] = { name = "Share" },
  }
  lvim.builtin.which_key.mappings[","]["u"] = { "<cmd>UpdatePackages<cr>", "Update packages" }

  lvim.builtin.which_key.vmappings[","] = {
    name = "Others",
    ["s"] = { name = "Share" },
  }

  local config_path = vim.fn.stdpath("config")
  vim.cmd("source " .. config_path .. "/lua/configs/share.vim")
  vim.cmd("source " .. config_path .. "/lua/configs/update-nix-fetchgit.vim")
  lvim.builtin.which_key.mappings[","]["s"]["p"] = { "<cmd>Share<cr>", "Pastebin" }
  lvim.builtin.which_key.vmappings[","]["s"]["p"] = { ":'<,'>Share<cr>", "Pastebin" }

  vim.keymap.set("n", "<M-d>", '"_d')
  vim.keymap.set("n", "<M-D>", '"_D')
  vim.keymap.set("x", "<M-D>", '"_D')
  vim.keymap.set("n", "<M-d><M-d>", '"_dd')

  vim.keymap.set("n", "<M-c>", '"_c')
  vim.keymap.set("n", "<M-C>", '"_C')
  vim.keymap.set("x", "<M-c>", '"_c')
  vim.keymap.set("n", "<M-c><M-c>", '"_cc')

  vim.keymap.set("n", "<M-x>", '"_x')
  vim.keymap.set("x", "<M-x>", '"_x')

  vim.keymap.set("n", "ZZ", "<cmd>xa<cr>")
  vim.keymap.set("x", "ZQ", "<cmd>qa<cr>")

  vim.keymap.set("n", "<tab>", "<cmd>tabnext<cr>")
  vim.keymap.set("n", "<s-tab>", "<cmd>tab split<cr>")
  vim.keymap.set("n", "<m-tab>", "<cmd>tabclose<cr>")

  vim.keymap.set("n", "<C-g>", "<cmd>lua require 'lvim.core.terminal'.lazygit_toggle()<cr>")
end

return M
