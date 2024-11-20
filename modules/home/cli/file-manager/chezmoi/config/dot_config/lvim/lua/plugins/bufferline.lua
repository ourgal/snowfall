local M = {}

M.config = function()
  vim.cmd("function! TbToggle_theme(a,b,c,d) \n lua require('themes.utils').toggle_theme() \n endfunction")
  vim.cmd("function! Quit_vim(a,b,c,d) \n qa \n endfunction")
  local kind = require("configs.lsp_kind")
  lvim.builtin.bufferline.highlights = {
    background = { italic = true },
    buffer_selected = { bold = true },
    buffer_visible = {
      fg = "#9696ca",
    },
  }
  if lvim.builtin.time_based_themes then
    lvim.builtin.bufferline.highlights.fill = {
      bg = {
        attribute = "bg",
        highlight = "NormalNC",
      },
    }
  end
  local g_ok, bufferline_groups = pcall(require, "bufferline.groups")
  if not g_ok then
    bufferline_groups = {
      builtin = {
        pinned = {
          name = "pinned",
          with = function(_ico) end,
        },
        ungroupued = { name = "ungrouped" },
      },
    }
  end
  lvim.builtin.bufferline.options = {
    navigation = { mode = "uncentered" },
    diagnostics = "nvim_lsp", -- do not show diagnostics in bufferline
    diagnostics_indicator = function(_, _, diagnostics)
      local result = {}
      local symbols = { error = kind.icons.error, warning = kind.icons.warn, info = kind.icons.info }
      for name, count in pairs(diagnostics) do
        if symbols[name] and count > 0 then
          table.insert(result, symbols[name] .. count)
        end
      end
      local res = table.concat(result, " ")
      return #res > 0 and res or ""
    end,
    mode = "buffers",
    sort_by = "insert_after_current",
    always_show_bufferline = false,
    custom_filter = function(buf_number, buf_numbers)
      -- filter out by buffer name
      if vim.fn.bufname(buf_number) ~= "[BufExplorer]" then
        return true
      end
    end,
    groups = {
      options = {
        toggle_hidden_on_enter = true,
      },
      items = {
        bufferline_groups.builtin.pinned:with({ icon = "" }),
        bufferline_groups.builtin.ungrouped,
        {
          name = "Internals",
          highlight = { fg = "#ECBE7B" },
          matcher = function(buf)
            return vim.startswith(buf.path, vim.env.VIMRUNTIME) or vim.startswith(buf.path, _G.get_runtime_dir())
          end,
        },
        {
          highlight = { sp = "#51AFEF" },
          name = "Tests",
          icon = kind.icons.test,
          matcher = function(buf)
            local name = vim.api.nvim_buf_get_name(buf.id)
            return name:match("_spec") or name:match("_test") or name:match("test_")
          end,
        },
        {
          name = "Terraform",
          matcher = function(buf)
            return buf.name:match("%.tf") ~= nil
          end,
        },
        {
          name = "SQL",
          matcher = function(buf)
            local name = vim.api.nvim_buf_get_name(buf.id)
            return name:match("%.sql$")
          end,
        },
        {
          name = "View models",
          highlight = { sp = "#03589C" },
          matcher = function(buf)
            local name = vim.api.nvim_buf_get_name(buf.id)
            return name:match("view_model%.dart")
          end,
        },
        {
          name = "Screens",
          icon = kind.icons.screen,
          matcher = function(buf)
            return buf.path:match("screen")
          end,
        },
        {
          highlight = { sp = "#C678DD" },
          name = "Docs",
          matcher = function(buf)
            for _, ext in ipairs({ "md", "txt", "org", "norg", "wiki" }) do
              if ext == vim.fn.fnamemodify(buf.path, ":e") then
                return true
              end
            end
          end,
        },
        {
          highlight = { sp = "#F6A878" },
          name = "Config",
          matcher = function(buf)
            local name = vim.api.nvim_buf_get_name(buf.id)
            local filename = vim.split(name, "/", { plain = true })[-1]
            if filename == nil then
              return false
            end
            return filename:match("go.mod")
              or filename:match("go.sum")
              or filename:match("Cargo.toml")
              or filename:match("manage.py")
              or filename:match("Makefile")
          end,
        },
        {
          name = "Terms",
          auto_close = true,
          matcher = function(buf)
            return buf.path:match("term://") ~= nil
          end,
        },
      },
    },
    hover = { enabled = true, reveal = { "close" } },
    offsets = {
      {
        text = "EXPLORER",
        filetype = "neo-tree",
        highlight = "PanelHeading",
        text_align = "left",
        separator = true,
      },
      {
        text = " FLUTTER OUTLINE",
        filetype = "flutterToolsOutline",
        highlight = "PanelHeading",
        separator = true,
      },
      {
        text = "UNDOTREE",
        filetype = "undotree",
        highlight = "PanelHeading",
        separator = true,
      },
      {
        text = "󰇚 LAZY",
        filetype = "lazy",
        highlight = "PanelHeading",
        separator = true,
      },
      {
        text = "󰆼 DATABASE VIEWER",
        filetype = "dbui",
        highlight = "PanelHeading",
        separator = true,
      },
      {
        text = " DIFF VIEW",
        filetype = "DiffviewFiles",
        highlight = "PanelHeading",
        separator = true,
      },
    },
    separator_style = (vim.env.KITTY_WINDOW_ID or vim.env.WEZTERM_UNIX_SOCKET) and "slant" or "thin",
    right_mouse_command = "vert sbuffer %d",
    show_close_icon = false,
    -- indicator = { style = "bold" },
    indicator = {
      icon = "▎", -- this should be omitted if indicator style is not 'icon'
      style = "icon", -- can also be 'underline'|'none',
    },
    max_name_length = 18,
    max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
    truncate_names = true, -- whether or not tab names should be truncated
    tab_size = 18,
    color_icons = true,
    show_buffer_close_icons = true,
    diagnostics_update_in_insert = false,
  }

  if lvim.builtin.time_based_themes then
    lvim.builtin.bufferline.options.custom_areas = {
      right = function()
        return {
          { text = "%@TbToggle_theme@" .. vim.g.toggle_theme_icon .. "%X" },
          { text = "%@Quit_vim@󰅙 %X", fg = "#f7768e" },
        }
      end,
    }
  end
  -- ╭──────────────────────────────────────────────────────────╮
  -- │                          keymap                          │
  -- ╰──────────────────────────────────────────────────────────╯
  if not lvim.builtin.user_bufferline_cycle then
    lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
    lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
  end
  lvim.keys.normal_mode["<S-x>"] = "<Cmd>lua require('plugins.bufferline').delete_buffer()<CR>"
  lvim.builtin.which_key.mappings["b"] = {
    name = "Buffer",
    ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
    ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
    ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
    ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
    ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
    ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
    ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
    ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
    ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
    c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
    p = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin" },
    -- s = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
    -- t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
    f = { "<cmd>Telescope buffers<cr>", "Find" },
    b = { "<cmd>b#<cr>", "Previous" },
    o = { "<cmd>%bd|e#|bd#<cr>", "Close other bufs" },
    h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
    l = {
      "<cmd>BufferLineCloseRight<cr>",
      "Close all to the right",
    },
    D = {
      "<cmd>BufferLineSortByDirectory<cr>",
      "Sort by directory",
    },
    L = {
      "<cmd>BufferLineSortByExtension<cr>",
      "Sort by language",
    },
    ["<"] = { "<Cmd>BufferLineMovePrev<CR>", "MovePrev" },
    [">"] = { "<Cmd>BufferLineMoveNext<CR>", "MoveNext" },
  }
end

M.delete_buffer = function()
  local fn = vim.fn
  local cmd = vim.cmd
  local buflisted = fn.getbufinfo({ buflisted = 1 })
  local cur_winnr, cur_bufnr = fn.winnr(), fn.bufnr()
  if #buflisted < 2 then
    cmd("confirm qall")
    return
  end
  for _, winid in ipairs(fn.getbufinfo(cur_bufnr)[1].windows) do
    cmd(string.format("%d wincmd w", fn.win_id2win(winid)))
    cmd(cur_bufnr == buflisted[#buflisted].bufnr and "bp" or "bn")
  end
  cmd(string.format("%d wincmd w", cur_winnr))
  local is_terminal = fn.getbufvar(cur_bufnr, "&buftype") == "terminal"
  cmd(is_terminal and "bd! #" or "silent! confirm bd #")
end

M.keymap = function()
  if lvim.builtin.bufferline.active then
    lvim.keys.normal_mode["<S-x>"] = "<Cmd>lua require('plugins.bufferline').delete_buffer()<CR>"
    lvim.keys.normal_mode["<S-l>"] = "<Cmd>BufferLineCycleNext<CR>"
    lvim.keys.normal_mode["<S-h>"] = "<Cmd>BufferLineCyclePrev<CR>"
    lvim.builtin.which_key.mappings["b"] = {
      name = "󰕰 Buffer",
      ["1"] = { "<Cmd>BufferLineGoToBuffer 1<CR>", "goto 1" },
      ["2"] = { "<Cmd>BufferLineGoToBuffer 2<CR>", "goto 2" },
      ["3"] = { "<Cmd>BufferLineGoToBuffer 3<CR>", "goto 3" },
      ["4"] = { "<Cmd>BufferLineGoToBuffer 4<CR>", "goto 4" },
      ["5"] = { "<Cmd>BufferLineGoToBuffer 5<CR>", "goto 5" },
      ["6"] = { "<Cmd>BufferLineGoToBuffer 6<CR>", "goto 6" },
      ["7"] = { "<Cmd>BufferLineGoToBuffer 7<CR>", "goto 7" },
      ["8"] = { "<Cmd>BufferLineGoToBuffer 8<CR>", "goto 8" },
      ["9"] = { "<Cmd>BufferLineGoToBuffer 9<CR>", "goto 9" },
      c = { "<Cmd>BufferLinePickClose<CR>", "delete buffer" },
      p = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin" },
      s = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
      t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
      f = { "<cmd>Telescope buffers<cr>", "Find" },
      b = { "<cmd>b#<cr>", "Previous" },
      h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
      l = {
        "<cmd>BufferLineCloseRight<cr>",
        "Close all to the right",
      },
      D = {
        "<cmd>BufferLineSortByDirectory<cr>",
        "Sort by directory",
      },
      L = {
        "<cmd>BufferLineSortByExtension<cr>",
        "Sort by language",
      },
      ["<"] = { "<Cmd>BufferLineMovePrev<CR>", "MovePrev" },
      [">"] = { "<Cmd>BufferLineMoveNext<CR>", "MoveNext" },
    }
  end
end

return M
