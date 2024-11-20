return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    {
      -- only needed if you want to use the commands with "_with_window_picker" suffix
      "s1n7ax/nvim-window-picker",
      version = "v1.*",
      opts = {
        autoselect_one = true,
        include_current = false,
        filter_rules = {
          -- filter using buffer options
          bo = {
            -- if the file type is one of following, the window will be ignored
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            -- if the buffer type is one of following, the window will be ignored
            buftype = { "terminal", "quickfix" },
          },
        },
        other_win_hl_color = "#e35e4f",
      },
      config = function()
        require("window-picker").setup({
          autoselect_one = true,
          include_current = false,
          filter_rules = {
            -- filter using buffer options
            bo = {
              -- if the file type is one of following, the window will be ignored
              filetype = { "neo-tree", "neo-tree-popup", "notify" },
              -- if the buffer type is one of following, the window will be ignored
              buftype = { "terminal", "quickfix" },
            },
          },
          other_win_hl_color = "#e35e4f",
        })
      end,
    },
  },
  opts = {
    popup_border_style = "rounded",
    enable_diagnostics = false,
    source_selector = {
      winbar = true,
      separator_active = " ",
      statusline = false,
    },
    enable_git_status = true,
    git_status_async = true,
    default_component_configs = {
      indent = {
        padding = 0,
        with_expanders = false,
      },
      icon = {
        folder_closed = require("configs.lsp_kind").nvim_tree_icons.folder.default,
        folder_open = require("configs.lsp_kind").nvim_tree_icons.folder.open,
        folder_empty = require("configs.lsp_kind").nvim_tree_icons.folder.empty_open,
      },
      modified = {
        symbol = " ",
      },
      git_status = {
        symbols = require("configs.lsp_kind").nvim_tree_icons.git,
      },
    },
    window = {
      position = "left",
      width = 30,
    },
    filesystem = {
      group_empty_dirs = true,
      filtered_items = {
        visible = false,
        hide_dotfiles = true,
        hide_gitignored = false,
        hide_by_name = {
          ".DS_Store",
          "thumbs.db",
          "node_modules",
          "__pycache__",
        },
        never_show = {
          ".DS_Store",
        },
      },
      window = {
        mappings = {
          ["h"] = "navigate_up",
          ["l"] = "open",
        },
      },
      follow_current_file = { enabled = true },
      hijack_netrw_behavior = "open_current",
      use_libuv_file_watcher = true,
    },
    git_status = {
      window = {
        position = "float",
      },
    },
    event_handlers = {
      {
        event = "file_opened",
        handler = function(_)
          --auto close
          require("neo-tree.command").execute({ action = "close" })
        end,
      },
    },
  },
  init = function()
    lvim.builtin.which_key.mappings["e"] = {}
  end,
  keys = { { "<leader>e", "<cmd>Neotree toggle<CR>", desc = "󰀶 Explorer" } },
  enabled = lvim.user_plugins.edit.file_manager.sidebar.neo_tree,
}
