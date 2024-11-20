return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  lazy = true,
  event = "BufReadPre",
  dependencies = "nvim-treesitter",
  init = function()
    lvim.builtin.treesitter.textobjects = {
      select = {
        enable = true,
        lookahead = true,
        keymaps = {
          -- You can use the capture groups defined in textobjects.scm
          ["aA"] = "@attribute.outer",
          ["iA"] = "@attribute.inner",
          -- ["ab"] = "@block.outer",
          -- ["ib"] = "@block.inner",
          ["ac"] = "@call.outer",
          ["ic"] = "@call.inner",
          ["at"] = "@class.outer",
          ["it"] = "@class.inner",
          ["a/"] = "@comment.outer",
          ["i/"] = "@comment.inner",
          ["ai"] = "@conditional.outer",
          ["ii"] = "@conditional.inner",
          ["aF"] = "@frame.outer",
          ["iF"] = "@frame.inner",
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["al"] = "@loop.outer",
          ["il"] = "@loop.inner",
          ["aa"] = "@parameter.outer",
          ["ia"] = "@parameter.inner",
          ["is"] = "@scopename.inner",
          ["as"] = "@statement.outer",
          ["av"] = "@variable.outer",
          ["iv"] = "@variable.inner",
        },
      },
      swap = {
        enable = true,
        swap_next = {
          ["<leader><M-a>"] = "@parameter.inner",
          ["<leader><M-f>"] = "@function.outer",
          ["<leader><M-e>"] = "@element",
        },
        swap_previous = {
          ["<leader><M-A>"] = "@parameter.inner",
          ["<leader><M-F>"] = "@function.outer",
          ["<leader><M-E>"] = "@element",
        },
      },
      move = {
        enable = true,
        set_jumps = true, -- whether to set jumps in the jumplist
        goto_next_start = {
          ["]p"] = "@parameter.inner",
          ["]f"] = "@function.outer",
          ["]]"] = "@class.outer",
        },
        goto_next_end = {
          ["]F"] = "@function.outer",
          ["]["] = "@class.outer",
        },
        goto_previous_start = {
          ["[p"] = "@parameter.inner",
          ["[f"] = "@function.outer",
          ["[["] = "@class.outer",
        },
        goto_previous_end = {
          ["[F"] = "@function.outer",
          ["[]"] = "@class.outer",
        },
      },
    }
  end,
  enabled = lvim.user_plugins.edit.treesitter.textobj.second,
}
