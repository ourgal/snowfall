local M = {}

M.config = function()
  local FOO = "_murmur"
  vim.api.nvim_create_augroup(FOO, { clear = true })
  table.insert(lvim.plugins, {
    "nyngwang/murmur.lua",

    config = function()
      require("murmur").setup({
        -- cursor_rgb = {
        --  guibg = '#393939',
        -- },
        -- cursor_rgb_always_use_config = false, -- if set to `true`, then always use `cursor_rgb`.
        -- yank_blink = {
        --   enabled = true,
        --   on_yank = nil, -- Can be customized. See `:h on_yank`.
        -- },
        max_len = 80,
        min_len = 3, -- this is recommended since I prefer no cursorword highlighting on `if`.
        exclude_filetypes = {},
        callbacks = {
          -- to trigger the close_events of vim.diagnostic.open_float.
          function()
            -- Close floating diag. and make it triggerable again.
            vim.cmd("doautocmd InsertEnter")
            vim.w.diag_shown = false
          end,
        },
      })

      -- To create IDE-like no blinking diagnostic message with `cursor` scope. (should be paired with the callback above)
      vim.api.nvim_create_autocmd({ "CursorHold" }, {
        group = FOO,
        pattern = "*",
        callback = function()
          -- skip when a float-win already exists.
          if vim.w.diag_shown then
            return
          end

          -- open float-win when hovering on a cursor-word.
          if vim.w.cursorword ~= "" then
            vim.diagnostic.open_float()
            vim.w.diag_shown = true
          end
        end,
      })

      -- To create special cursorword coloring for the colortheme `typewriter-night`.
      -- remember to change it to the name of yours.
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        group = FOO,
        pattern = "typewriter-night",
        callback = function()
          vim.api.nvim_set_hl(0, "murmur_cursor_rgb", { fg = "#0a100d", bg = "#ffee32" })
        end,
      })
    end,
    enabled = lvim.user_plugins.edit.highlight.word.fourth or lvim.user_plugins.edit.lsp.diagnostics.murmur,
  })
end

return M
