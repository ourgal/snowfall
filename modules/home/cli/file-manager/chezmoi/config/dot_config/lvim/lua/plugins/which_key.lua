local M = {}

M.config = function()
  lvim.builtin.which_key.setup.window.winblend = 10
  lvim.builtin.which_key.setup.window.border = "none"
  lvim.builtin.which_key.setup.plugins = {
    marks = true, -- shows a list of your marks on ' and `
    registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
    spelling = {
      enabled = false,
      suggestions = 20,
    }, -- use which-key for spelling hints
    -- the presets plugin, adds help for a bunch of default keybindings in Neovim
    -- No actual key bindings are created
    presets = {
      operators = true, -- adds help for operators like d, y, ...
      motions = true, -- adds help for motions
      text_objects = true, -- help for text objects triggered after entering an operator
      windows = true, -- default bindings on <c-w>
      nav = true, -- misc bindings to work with windows
      z = true, -- bindings for folds, spelling and others prefixed with z
      g = true, -- bindings for prefixed with g
    },
  }
  lvim.builtin.which_key.setup.icons = {
    breadcrumb = "/", -- symbol used in the command line area that shows your active key combo
    separator = "·", -- symbol used between a key and it's label
    group = "", -- symbol prepended to a group
  }
  lvim.builtin.which_key.setup.ignore_missing = false

  -- ╭──────────────────────────────────────────────────────────╮
  -- │                          keymap                          │
  -- ╰──────────────────────────────────────────────────────────╯
  -- lvim.builtin.which_key.mappings["q"] = { ":wqa<CR>", "󰗼 Quit" }
  -- lvim.builtin.which_key.mappings["t"] = {
  -- 	name = "Tab",
  -- 	["1"] = { ":1tabnext<CR>", "goto 1" },
  -- 	["2"] = { ":2tabnext<CR>", "goto 2" },
  -- 	["3"] = { ":3tabnext<CR>", "goto 3" },
  -- 	["4"] = { ":4tabnext<CR>", "goto 4" },
  -- 	["5"] = { ":5tabnext<CR>", "goto 5" },
  -- 	["6"] = { ":6tabnext<CR>", "goto 6" },
  -- 	["7"] = { ":7tabnext<CR>", "goto 7" },
  -- 	["8"] = { ":8tabnext<CR>", "goto 8" },
  -- 	["9"] = { ":9tabnext<CR>", "goto 9" },
  -- 	n = { ":tabnew<CR>", "New tab" },
  -- 	x = { ":tabclose<CR>", "Close tab" },
  -- 	[">"] = { ":tabmove +<CR>", "Move tab right" },
  -- 	["<"] = { ":tabmove -<CR>", "Move tab left" },
  -- p = { "<Cmd>BufferLineTogglePin<CR>", "toggle pin" },
  -- s = { "<Cmd>BufferLinePick<CR>", "pick buffer" },
  -- t = { "<Cmd>BufferLineGroupToggle docs<CR>", "toggle groups" },
  -- f = { "<cmd>Telescope buffers<cr>", "Find" },
  -- b = { "<cmd>b#<cr>", "Previous" },
  -- h = { "<cmd>BufferLineCloseLeft<cr>", "Close all to the left" },
  -- l = {
  -- 	"<cmd>BufferLineCloseRight<cr>",
  -- 	"Close all to the right",
  -- },
  -- D = {
  -- 	"<cmd>BufferLineSortByDirectory<cr>",
  -- 	"Sort by directory",
  -- },
  -- L = {
  -- 	"<cmd>BufferLineSortByExtension<cr>",
  -- 	"Sort by language",
  -- },
  -- }
  lvim.builtin.which_key.mappings["h"] = {}
  lvim.builtin.which_key.mappings["."] = { name = "" }
  lvim.builtin.which_key.mappings["@"] = { name = "Macro" }
  -- lvim.builtin.which_key.vmappings["a"] = { ":'<,'>lua vim.lsp.buf.code_action()<CR>", "Code actions" }
  lvim.builtin.which_key.mappings["c"] = {}
  lvim.builtin.which_key.mappings["t"] = { name = "󰨮 Test" }
  lvim.builtin.which_key.mappings["T"] = {}
  lvim.builtin.which_key.mappings["m"] = { name = " Bookmarks" }
  lvim.builtin.which_key.mappings["E"] = { name = "󰗊 Translate" }
  lvim.builtin.which_key.vmappings["E"] = { name = "󰗊 Translate" }
  lvim.builtin.which_key.mappings["r"] = { name = " Trouble" }
  lvim.builtin.which_key.mappings["R"] = { vim.lsp.buf.rename, " Replace" }
  lvim.builtin.which_key.mappings["C"] = { name = " Comment Box" }
  lvim.builtin.which_key.vmappings["C"] = { name = " Comment Box" }
  -- lvim.builtin.which_key.mappings["*"] = { name = "󱊈 Other" }
  -- lvim.builtin.which_key.vmappings["*"] = { name = "󱊈 Other" }
  lvim.builtin.which_key.mappings["s"].name = " Search"
  lvim.builtin.which_key.mappings["S"] = { name = " Share" }
  lvim.builtin.which_key.vmappings["S"] = { name = " Share" }
  lvim.builtin.which_key.mappings["g"].name = "󰊢 Git"
  lvim.builtin.which_key.mappings["d"].name = " Debug"
  lvim.builtin.which_key.mappings["p"].name = " Plugins"
end

M.keymap = function() end
return M
