vim.keymap.set("n", "q", "<cmd>q<cr>", { noremap = true, silent = true, buffer = true })

vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  command = "wincmd T",
  buffer = 0,
})
