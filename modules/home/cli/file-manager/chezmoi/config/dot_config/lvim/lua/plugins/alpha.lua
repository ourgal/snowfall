local M = {}

M.config = function()
  if not lvim.builtin.alpha.active == true then
    return
  end

  local kind = require("configs.lsp_kind")

  local header = {
    type = "text",
    val = require("configs.banners").dashboard(),
    opts = {
      position = "center",
      hl = "Comment",
    },
  }

  local plugins = ""
  local date = os.date("%a %d %b")
  if vim.fn.has("linux") == 1 or vim.fn.has("mac") == 1 then
    local handle = io.popen('fd -d 2 . $HOME"/.local/share/lunarvim/site/pack/lazy" | grep pack | wc -l | tr -d "\n" ')
    if handle ~= nil then
      plugins = handle:read("*a")
      handle:close()
      plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
    end
  elseif vim.fn.has("windows") then
    local handle =
      io.popen('fd -d 2 . $HOME"\\AppData\\Roaming\\lunarvim\\site\\pack\\lazy" | rg pack | wc -l | tr -d "\n" ')
    if handle ~= nil then
      plugins = handle:read("*a")
      handle:close()
      plugins = plugins:gsub("^%s*(.-)%s*$", "%1")
    end
  else
    plugins = "N/A"
  end

  local plugin_count = {
    type = "text",
    val = "└─ "
      .. kind.cmp_kind.Module
      .. string.format("% 3d", plugins)
      .. " plugins 󰄛 v"
      .. vim.version().major
      .. "."
      .. vim.version().minor
      .. "."
      .. vim.version().patch
      .. " ─┘",
    opts = {
      position = "center",
      hl = "String",
    },
  }

  local heading = {
    type = "text",
    val = "┌─ " .. kind.icons.calendar .. " Today is " .. date .. "   ─┐",
    opts = {
      position = "center",
      hl = "String",
    },
  }

  local fortune = require("alpha.fortune")()
  -- fortune = fortune:gsub("^%s+", ""):gsub("%s+$", "")
  local footer = {
    type = "text",
    val = fortune,
    opts = {
      position = "center",
      hl = "Comment",
      hl_shortcut = "Comment",
    },
  }

  local function button(sc, txt, keybind)
    local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

    local opts = {
      position = "center",
      text = txt,
      shortcut = sc,
      cursor = 5,
      width = 24,
      align_shortcut = "right",
      hl_shortcut = "Number",
      hl = "Function",
    }
    if keybind then
      opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
    end

    return {
      type = "button",
      val = txt,
      on_press = function()
        local key = vim.api.nvim_replace_termcodes(sc_, true, false, true)
        vim.api.nvim_feedkeys(key, "normal", false)
      end,
      opts = opts,
    }
  end

  local buttons = {
    type = "group",
    val = {
      button(
        "f",
        " " .. kind.cmp_kind.Folder .. " Explore",
        "<cmd>lua require('plugins.telescope').find_project_files()<CR>"
      ),
      button("e", " " .. kind.cmp_kind.File .. " New file", ":ene <BAR> startinsert <CR>"),
      -- button("s", " " .. kind.icons.magic .. " Restore", ":lua require('persistence').load()<cr>"),
      button("g", " " .. kind.icons.git .. " Git Status", ":lua require 'lvim.core.terminal'.lazygit_toggle()<CR>"),
      button("r", " " .. kind.icons.clock .. " Recents", ":Telescope oldfiles<CR>"),
      button("c", " " .. kind.icons.settings .. " Config", ":e ~/.config/lvim/config.lua<CR>"),
      button("q", " " .. kind.icons.exit .. " Quit", ":q<CR>"),
    },
    opts = {
      spacing = 1,
    },
  }

  local section = {
    header = header,
    buttons = buttons,
    plugin_count = plugin_count,
    heading = heading,
    footer = footer,
  }

  local opts = {
    layout = {
      { type = "padding", val = 1 },
      section.header,
      { type = "padding", val = 2 },
      section.heading,
      section.plugin_count,
      { type = "padding", val = 1 },
      -- section.top_bar,
      section.buttons,
      -- section.bot_bar,
      -- { type = "padding", val = 1 },
      section.footer,
    },
    opts = {
      margin = 5,
    },
  }

  -- ╭──────────────────────────────────────────────────────────╮
  -- │                           init                           │
  -- ╰──────────────────────────────────────────────────────────╯
  lvim.builtin.alpha.mode = "custom"
  lvim.builtin.alpha["custom"] = { config = opts }

  -- ╭──────────────────────────────────────────────────────────╮
  -- │                          keymap                          │
  -- ╰──────────────────────────────────────────────────────────╯
  lvim.builtin.which_key.mappings[";"] = { "<cmd>Alpha<CR>", "󰕮 Dashboard" }
end

return M
