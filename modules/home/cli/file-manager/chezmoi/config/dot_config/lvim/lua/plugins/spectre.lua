return {
  "nvim-pack/nvim-spectre",
  event = "BufRead",
  config = true,
  opts = {
    mapping = {
      ["toggle_line"] = {
        map = "td",
        cmd = "<cmd>lua require('spectre').toggle_line()<CR>",
        desc = "toggle item",
      },
      ["enter_file"] = {
        map = "<cr>",
        cmd = "<cmd>lua require('spectre.actions').select_entry()<CR>",
        desc = "open file",
      },
      ["send_to_qf"] = {
        map = "tq",
        cmd = "<cmd>lua require('spectre.actions').send_to_qf()<CR>",
        desc = "send all items to quickfix",
      },
      ["replace_cmd"] = {
        map = "tc",
        cmd = "<cmd>lua require('spectre.actions').replace_cmd()<CR>",
        desc = "input replace command",
      },
      ["show_option_menu"] = {
        map = "to",
        cmd = "<cmd>lua require('spectre').show_options()<CR>",
        desc = "show options",
      },
      ["run_current_replace"] = {
        map = "tr",
        cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
        desc = "replace current line",
      },
      ["run_replace"] = {
        map = "tR",
        cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
        desc = "replace all",
      },
      ["change_view_mode"] = {
        map = "tv",
        cmd = "<cmd>lua require('spectre').change_view()<CR>",
        desc = "change result view mode",
      },
      ["change_replace_sed"] = {
        map = "tes",
        cmd = "<cmd>lua require('spectre').change_engine_replace('sed')<CR>",
        desc = "use sed to replace",
      },
      ["change_replace_oxi"] = {
        map = "teo",
        cmd = "<cmd>lua require('spectre').change_engine_replace('oxi')<CR>",
        desc = "use oxi to replace",
      },
      ["toggle_live_update"] = {
        map = "tu",
        cmd = "<cmd>lua require('spectre').toggle_live_update()<CR>",
        desc = "update when vim writes to file",
      },
      ["toggle_ignore_case"] = {
        map = "ti",
        cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
        desc = "toggle ignore case",
      },
      ["toggle_ignore_hidden"] = {
        map = "th",
        cmd = "<cmd>lua require('spectre').change_options('hidden')<CR>",
        desc = "toggle search hidden",
      },
      ["resume_last_search"] = {
        map = "tl",
        cmd = "<cmd>lua require('spectre').resume_last_search()<CR>",
        desc = "repeat last search",
      },
      -- you can put your mapping here it only use normal mode
    },
  },
  keys = {
    {
      "<leader>Rf",
      function()
        require("spectre").open_file_search()
      end,
      desc = "Current Buffer",
    },
    {
      "<leader>Rp",
      function()
        require("spectre").open()
      end,
      desc = "Project",
    },
    {
      "<leader>Rw",
      function()
        require("spectre").open_visual({ select_word = true })
      end,
      desc = "Replace Word",
    },
  },
  --TODO clean keymap
  enabled = lvim.user_plugins.edit.replace.spectre,
}
