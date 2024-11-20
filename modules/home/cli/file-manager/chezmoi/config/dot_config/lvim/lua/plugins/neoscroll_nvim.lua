return {
  "karb94/neoscroll.nvim",
  config = function()
    require("neoscroll").setup({})
    local t = {}
    -- Syntax: t[keys] = {function, {function arguments}}
    -- t["gg"] = { "scroll", { "-2*vim.api.nvim_buf_line_count(0)", "true", "1", "5" } }
    -- t["G"] = { "scroll", { "2*vim.api.nvim_buf_line_count(0)", "true", "1", "5" } }
    t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "100" } }
    -- t["<PageUp>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "100" } }
    t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "100" } }
    -- t["<PageDown>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "100" } }
    require("neoscroll.config").set_mappings(t)
  end,
  event = "BufRead",
  enabled = lvim.user_plugins.edit.scroll.second,
}
