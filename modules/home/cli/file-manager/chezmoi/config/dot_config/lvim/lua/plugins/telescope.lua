local M = {}
local action_state = require("telescope.actions.state")
local themes = require("telescope.themes")
local builtin = require("telescope.builtin")
local actions = require("telescope.actions")
local telescope_utils = require("telescope.utils")

function M._multiopen(prompt_bufnr, open_cmd)
  local picker = action_state.get_current_picker(prompt_bufnr)
  local num_selections = table.getn(picker:get_multi_selection())
  local border_contents = picker.prompt_border.contents[1]
  if not (string.find(border_contents, "Find Files") or string.find(border_contents, "Git Files")) then
    actions.select_default(prompt_bufnr)
    return
  end
  if num_selections > 1 then
    vim.cmd("bw!")
    for _, entry in ipairs(picker:get_multi_selection()) do
      vim.cmd(string.format("%s %s", open_cmd, entry.value))
    end
    vim.cmd("stopinsert")
  else
    if open_cmd == "vsplit" then
      actions.file_vsplit(prompt_bufnr)
    elseif open_cmd == "split" then
      actions.file_split(prompt_bufnr)
    elseif open_cmd == "tabe" then
      actions.file_tab(prompt_bufnr)
    else
      actions.file_edit(prompt_bufnr)
    end
  end
end

function M.multi_selection_open_vsplit(prompt_bufnr)
  M._multiopen(prompt_bufnr, "vsplit")
end

function M.multi_selection_open_split(prompt_bufnr)
  M._multiopen(prompt_bufnr, "split")
end

function M.multi_selection_open_tab(prompt_bufnr)
  M._multiopen(prompt_bufnr, "tabe")
end

function M.multi_selection_open(prompt_bufnr)
  M._multiopen(prompt_bufnr, "edit")
end

-- beautiful default layout for telescope prompt
function M.layout_config()
  return {
    width = 0.90,
    height = 0.85,
    preview_cutoff = 120,
    prompt_position = "bottom",
    horizontal = {
      preview_width = function(_, cols, _)
        return math.floor(cols * 0.6)
      end,
    },
    vertical = {
      width = 0.9,
      height = 0.95,
      preview_height = 0.5,
    },

    flex = {
      horizontal = {
        preview_width = 0.9,
      },
    },
  }
end

-- another file string search
function M.find_string()
  local opts = {
    border = true,
    previewer = false,
    shorten_path = false,
    layout_strategy = "flex",
    layout_config = {
      width = 0.9,
      height = 0.8,
      horizontal = { width = { padding = 0.15 } },
      vertical = { preview_height = 0.75 },
    },
    file_ignore_patterns = {
      "vendor/*",
      "node_modules",
      "%.jpg",
      "%.jpeg",
      "%.png",
      "%.svg",
      "%.otf",
      "%.ttf",
    },
  }
  builtin.live_grep(opts)
end

-- show refrences to this using language server
function M.lsp_references()
  local opts = {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_references(opts)
end

-- show implementations of the current thingy using language server
function M.lsp_implementations()
  local opts = {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
    sorting_strategy = "ascending",
    ignore_filename = false,
  }
  builtin.lsp_implementations(opts)
end

-- find files in the upper directory
function M.find_updir()
  local up_dir = vim.fn.getcwd():gsub("(.*)/.*$", "%1")
  local opts = {
    cwd = up_dir,
  }

  builtin.find_files(opts)
end

function M.installed_plugins()
  builtin.find_files({
    cwd = join_paths(os.getenv("LUNARVIM_RUNTIME_DIR"), "site", "pack", "lazy"),
  })
end

function M.project_search()
  builtin.find_files({
    previewer = false,
    layout_strategy = "vertical",
    cwd = require("lspconfig/util").root_pattern(".git")(vim.fn.expand("%:p")),
  })
end

function M.curbuf()
  local opts = themes.get_dropdown({
    winblend = 10,
    previewer = false,
    shorten_path = false,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    border = {},
    layout_config = {
      width = 0.45,
      prompt_position = "top",
    },
  })
  builtin.current_buffer_fuzzy_find(opts)
end

function M.git_status()
  local opts = themes.get_dropdown({
    winblend = 10,
    previewer = false,
    shorten_path = false,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    border = {},
    layout_config = {
      width = 0.45,
      prompt_position = "top",
    },
  })

  -- Can change the git icons using this.
  -- opts.git_icons = {
  --   changed = "M"
  -- }

  builtin.git_status(opts)
end

function M.search_only_certain_files()
  builtin.find_files({
    find_command = {
      "rg",
      "--files",
      "--type",
      vim.fn.input("Type: "),
    },
  })
end

function M.builtin()
  builtin.builtin()
end

function M.git_files()
  local path = vim.fn.expand("%:h")
  if path == "" then
    path = nil
  end

  local width = 0.45
  if path and string.find(path, "sourcegraph.*sourcegraph", 1, false) then
    width = 0.6
  end

  local opts = themes.get_dropdown({
    winblend = 5,
    previewer = false,
    shorten_path = false,
    borderchars = {
      prompt = { "─", "│", " ", "│", "╭", "╮", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "╯", "╰" },
      preview = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    },
    border = {},
    cwd = path,
    layout_config = {
      width = width,
      prompt_position = "top",
    },
  })

  opts.file_ignore_patterns = {
    "^[.]vale/",
  }
  builtin.git_files(opts)
end

function M.grep_string_visual()
  local visual_selection = function()
    local save_previous = vim.fn.getreg("a")
    vim.api.nvim_command('silent! normal! "ay')
    local selection = vim.fn.trim(vim.fn.getreg("a"))
    vim.fn.setreg("a", save_previous)
    return vim.fn.substitute(selection, [[\n]], [[\\n]], "g")
  end
  require("telescope.builtin").live_grep({
    default_text = visual_selection(),
  })
end

function M.find_project_files(opts)
  opts = opts or {}
  if opts.cwd then
    opts.cwd = vim.fn.expand(opts.cwd)
  else
    opts.cwd = vim.loop.cwd()
  end

  local _, ret = telescope_utils.get_os_command_output({ "git", "rev-parse", "--show-toplevel" }, opts.cwd)
  if ret ~= 0 then
    local in_worktree = telescope_utils.get_os_command_output({ "git", "rev-parse", "--is-inside-work-tree" }, opts.cwd)
    local in_bare = telescope_utils.get_os_command_output({ "git", "rev-parse", "--is-bare-repository" }, opts.cwd)
    if in_worktree[1] ~= "true" and in_bare[1] ~= "true" then
      builtin.find_files(opts)
      return
    end
  end
  builtin.git_files(opts)
end

M.config = function()
  -- Telescope
  -- =========================================
  -- lvim.builtin.telescope.defaults.path_display = { "smart", "absolute", "truncate" }
  lvim.builtin.telescope.defaults.dynamic_preview_title = true
  lvim.builtin.telescope.defaults.path_display = { shorten = 10 }
  lvim.builtin.telescope.defaults.prompt_prefix = "  "
  lvim.builtin.telescope.defaults.borderchars = {
    prompt = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    results = { "─", "▐", "─", "│", "╭", "▐", "▐", "╰" },
    -- results = {' ', '▐', '▄', '▌', '▌', '▐', '▟', '▙' };
    preview = { " ", "│", " ", "▌", "▌", "╮", "╯", "▌" },
  }
  lvim.builtin.telescope.defaults.selection_caret = "  "
  lvim.builtin.telescope.defaults.cache_picker = { num_pickers = 3 }
  lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
  lvim.builtin.telescope.defaults.file_ignore_patterns = {
    "vendor/*",
    "%.lock",
    "__pycache__/*",
    "%.sqlite3",
    "%.ipynb",
    "node_modules/*",
    "%.jpg",
    "%.jpeg",
    "%.png",
    "%.svg",
    "%.otf",
    "%.ttf",
    ".git/",
    "%.webp",
    ".dart_tool/",
    ".github/",
    ".gradle/",
    ".idea/",
    ".settings/",
    ".vscode/",
    "__pycache__/",
    "build/",
    "env/",
    "gradle/",
    "node_modules/",
    "target/",
    "%.pdb",
    "%.dll",
    "%.class",
    "%.exe",
    "%.cache",
    "%.ico",
    "%.pdf",
    "%.dylib",
    "%.jar",
    "%.docx",
    "%.met",
    "smalljre_*/*",
    ".vale/",
    "%.burp",
    "%.mp4",
    "%.mkv",
    "%.rar",
    "%.zip",
    "%.7z",
    "%.tar",
    "%.bz2",
    "%.epub",
    "%.flac",
    "%.tar.gz",
  }
  local user_telescope = require("plugins.telescope")
  lvim.builtin.telescope.defaults.layout_config = user_telescope.layout_config()
  -- local actions = require "telescope.actions"
  table.insert(lvim.builtin.telescope.extensions, {
    undo = {
      side_by_side = false,
      layout_strategy = "vertical",
      layout_config = {
        preview_height = 0.8,
      },
    },
  })

  table.insert(lvim.builtin.telescope.extensions, {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      -- find command (defaults to `fd`)
      find_cmd = "rg",
    },
  })

  lvim.builtin.telescope.defaults.mappings = {
    i = {
      ["<c-c>"] = require("telescope.actions").close,
      ["<c-y>"] = require("telescope.actions").which_key,
      ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
      ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
      ["<cr>"] = user_telescope.multi_selection_open,
      ["<c-v>"] = user_telescope.multi_selection_open_vsplit,
      ["<c-s>"] = user_telescope.multi_selection_open_split,
      ["<c-t>"] = user_telescope.multi_selection_open_tab,
      ["<c-j>"] = actions.move_selection_next,
      ["<c-k>"] = actions.move_selection_previous,
    },
    n = {
      ["<esc>"] = actions.close,
      ["<tab>"] = actions.toggle_selection + actions.move_selection_next,
      ["<s-tab>"] = actions.toggle_selection + actions.move_selection_previous,
      ["<cr>"] = user_telescope.multi_selection_open,
      ["<c-v>"] = user_telescope.multi_selection_open_vsplit,
      ["<c-s>"] = user_telescope.multi_selection_open_split,
      ["<c-t>"] = user_telescope.multi_selection_open_tab,
      ["<c-j>"] = actions.move_selection_next,
      ["<c-k>"] = actions.move_selection_previous,
      ["<c-n>"] = actions.cycle_history_next,
      ["<c-p>"] = actions.cycle_history_prev,
      ["<c-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
    },
  }
  local telescope_actions = require("telescope.actions.set")
  lvim.builtin.telescope.pickers.git_files = {
    hidden = true,
    show_untracked = true,
    layout_strategy = "horizontal",
  }
  lvim.builtin.telescope.pickers.live_grep = {
    only_sort_text = true,
    layout_strategy = "horizontal",
  }
  lvim.builtin.telescope.pickers.find_files = {
    layout_strategy = "horizontal",
    attach_mappings = function(_)
      telescope_actions.select:enhance({
        post = function()
          vim.cmd(":normal! zx")
        end,
      })
      return true
    end,
    find_command = { "fd", "--type=file", "--hidden" },
  }
  lvim.builtin.telescope.on_config_done = function(telescope)
    if lvim.user_plugins.edit.yank.second then
      telescope.load_extension("neoclip")
    end
  end
  -- ╭──────────────────────────────────────────────────────────╮
  -- │                          keymap                          │
  -- ╰──────────────────────────────────────────────────────────╯
  local mappings = lvim.builtin.which_key.mappings["s"]
  mappings["B"] = { "<cmd>lua require('plugins.telescope').builtin()<cr>", "Builtin" }
  mappings["p"] = { "<cmd>lua require('plugins.telescope').project_search()<cr>", "Project files" }
  mappings["l"] = {}
  mappings["t"] = {}
  mappings["L"] = { "<cmd>lua require('telescope.builtin').resume()<cr>", "Last Search" }
  mappings["z"] = { "<cmd>lua require('plugins.telescope').search_only_certain_files()<cr>", "Certain Filetype" }
  mappings["P"] = { "<cmd>Telescope projects<CR>", " Projects" }
  mappings["e"] = { "<cmd>Telescope file_browser<cr>", "File Browser" }
  lvim.builtin.which_key.mappings["s"] = mappings
  lvim.builtin.which_key.mappings["w"] = {}
  -- table.insert(lvim.builtin.which_key.mappings["s"], {
  -- 	s = { "<cmd>lua require('plugins.telescope').git_status()<cr>", "Git Status" },
  -- })
  lvim.builtin.which_key.mappings["f"] = {
    require("plugins.telescope").find_project_files,
    "󰈞 Find File",
  }
  lvim.keys.insert_mode["<A-s>"] =
    "<cmd>lua require('telescope').extensions.luasnip.luasnip(require('telescope.themes').get_cursor({}))<CR>"
  lvim.builtin.which_key.vmappings["s"] =
    { "<Cmd>lua require('plugins.telescope').grep_string_visual()<CR>", "Live Grep" }

  lvim.builtin.which_key.mappings["/"] = { "<cmd>Telescope live_grep<cr>", "live grep" }
  lvim.builtin.which_key.mappings["o"] = { "<cmd>Telescope lsp_document_symbols symbols=Function<cr>", "Symbols" }
end

return M
