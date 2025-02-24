return {
  "folke/noice.nvim",
  event = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  config = function()
    local status_ok, noice = pcall(require, "noice")
    if not status_ok then
      return
    end
    local spinners = require("noice.util.spinners")
    spinners.spinners["mine"] = {
      frames = {
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
        " ",
      },
      interval = 80,
    }
    noice.setup({
      format = {
        spinner = {
          name = "mine",
          hl = "Constant",
        },
      },
      lsp = {
        progress = {
          enabled = true,
          format = {
            { "{data.progress.percentage} ", hl_group = "Comment" },
            { "{spinner} ", hl_group = "NoiceLspProgressSpinner" },
            { "{data.progress.title} ", hl_group = "Comment" },
          },
          format_done = {},
        },
        hover = { enabled = true },
        signature = { enabled = false, auto_open = { enabled = false } },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = false,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      cmdline = {
        format = {
          filter = { pattern = "^:%s*!", icon = "󱆃", ft = "sh" },
          IncRename = {
            pattern = "^:%s*IncRename%s+",
            icon = "󰑕",
            conceal = true,
            opts = {
              -- relative = "cursor",
              -- size = { min_width = 20 },
              -- position = { row = -3, col = 0 },
              buf_options = { filetype = "text" },
            },
          },
        },
      },
      views = {
        cmdline_popup = {
          win_options = {
            winblend = 5,
            winhighlight = {
              Normal = "NormalFloat",
              FloatBorder = "NoiceCmdlinePopupBorder",
              IncSearch = "",
              Search = "",
            },
            cursorline = false,
          },
        },
      },
      popupmenu = {
        enabled = lvim.user_plugins.edit.completion.cmp.cmd,
      },
      routes = {
        {
          filter = { event = "msg_show", min_height = 10 },
          view = "split",
          opts = { enter = true },
        },
        {
          filter = { event = "msg_show", kind = "search_count" },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "; before #",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "; after #",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = " lines, ",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "go up one level",
          },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "yanked",
          },
          opts = { skip = true },
        },
        {
          filter = { find = "No active Snippet" },
          opts = { skip = true },
        },
        {
          filter = { find = "waiting for cargo metadata" },
          opts = { skip = true },
        },
        {
          filter = {
            event = "msg_show",
            find = "AutoSave: saved at ",
          },
          opts = { skip = true },
        },
        {
          filter = {
            find = "Translate success",
          },
          opts = { skip = true },
        },
        {
          filter = {
            find = "Renamed",
          },
          opts = { skip = true },
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        -- bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        -- long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = true, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    })
  end,
  enabled = lvim.user_plugins.edit.misc.notification.noice,
}
