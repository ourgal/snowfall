return {
  "echasnovski/mini.nvim",
  config = function()
    if lvim.user_plugins.edit.align then
      require("mini.align").setup({ mappings = {
        start = "ga",
        start_with_preview = "gA",
      } })
    end
    if lvim.user_plugins.edit.jump.square_brackets then
      require("mini.bracketed").setup()
    end
    if lvim.user_plugins.edit.split_join.mini then
      require("mini.splitjoin").setup({ mappings = { toggle = "r," } })
    end
    if lvim.user_plugins.edit.operators then
      require("mini.operators").setup({
        evaluate = {
          prefix = nil,
          func = nil,
        },
        exchange = {
          prefix = nil,
          reindent_linewise = true,
        },
        multiply = {
          prefix = "ym",
          func = nil,
        },
        replace = {
          prefix = "r",
          reindent_linewise = true,
        },
        sort = {
          prefix = "gz",
          func = nil,
        },
      })
    end
    -- require("mini.animate").setup({
    -- 	resize = { enable = false },
    -- 	open = { enable = false },
    -- 	close = { enable = false },
    -- })
    if lvim.user_plugins.edit.surround.first then
      require("mini.surround").setup({
        -- Module mappings. Use `''` (empty string) to disable one.
        mappings = {
          add = "rqa", -- Add surrounding in Normal and Visual modes
          delete = "rqd", -- Delete surrounding
          find = "rqf", -- Find surrounding (to the right)
          find_left = "rqF", -- Find surrounding (to the left)
          highlight = "rqh", -- Highlight surrounding
          replace = "rqr", -- Replace surrounding
          update_n_lines = "rqn", -- Update `n_lines`

          suffix_last = "l", -- Suffix to search with "prev" method
          suffix_next = "n", -- Suffix to search with "next" method
        },
      })
    end
    if lvim.user_plugins.edit.comment.toggle.mini then
      require("mini.comment").setup({
        mappings = {
          comment = nil,
          comment_line = "<C-c>",
          comment_visual = "<C-c>",
          iextobject = "gc",
        },
      })
    end
    -- require("mini.pairs").setup()
    if lvim.user_plugins.edit.misc.extra then
      require("mini.extra").setup()
    end
    -- local gen_ai_spec = require("mini.extra").gen_ai_spec
    if lvim.user_plugins.edit.textobj.mini then
      require("mini.ai").setup()
    end
  end,
  enabled = lvim.user_plugins.edit.align
    or lvim.user_plugins.edit.jump.square_brackets
    or lvim.user_plugins.edit.split_join.mini
    or lvim.user_plugins.edit.operators
    or lvim.user_plugins.edit.comment.toggle.mini
    or lvim.user_plugins.edit.misc.extra
    or lvim.user_plugins.edit.textobj.mini,
}
