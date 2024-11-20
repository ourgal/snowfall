return {
  "Cassin01/wf.nvim",
  version = "*",
  config = function()
    local which_key = require("wf.builtin.which_key")
    local register = require("wf.builtin.register")
    local bookmark = require("wf.builtin.bookmark")
    local buffer = require("wf.builtin.buffer")
    local mark = require("wf.builtin.mark")

    -- Register
    vim.keymap.set("n", "<Space>wr", register(), { noremap = true, silent = true, desc = "[wf.nvim] register" })

    -- Bookmark
    vim.keymap.set(
      "n",
      "<Space>wbo",
      bookmark({
        nvim = "~/.config/nvim",
        zsh = "~/.zshrc",
      })({ noremap = true, silent = true, desc = "[wf.nvim] bookmark" })
    )

    -- Buffer
    vim.keymap.set("n", "<Space>wbu", buffer({}), { noremap = true, silent = true, desc = "[wf.nvim] buffer" })

    -- Mark
    vim.keymap.set("n", "'", mark(), { nowait = true, noremap = true, silent = true, desc = "[wf.nvim] mark" })

    -- Which Key
    vim.keymap.set(
      "n",
      "<Leader>",
      which_key({ text_insert_in_advance = "<Leader>" }),
      { noremap = true, silent = true, desc = "[wf.nvim] which-key /" }
    )
  end,
  enabled = lvim.user_plugins.edit.wf,
}
