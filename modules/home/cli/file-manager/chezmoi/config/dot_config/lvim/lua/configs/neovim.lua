local M = {}

M.config = function()
  local disabled_plugins = {
    "2html_plugin",
    "getscript",
    "getscriptPlugin",
    "gzip",
    "logipat",
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "matchit",
    "tar",
    "tarPlugin",
    "rrhelper",
    "spellfile_plugin",
    "vimball",
    "vimballPlugin",
    "zip",
    "zipPlugin",
  }
  for _, plugin in pairs(disabled_plugins) do
    vim.g["loaded_" .. plugin] = 1
  end
  -- vim.g.did_load_filetypes = 1
  vim.opt.cmdheight = 0
  vim.g.ultest_summary_width = 30
  vim.g.ultest_deprecation_notice = 0
  vim.opt.completeopt = { "menu", "menuone", "noinsert" }

  vim.opt.relativenumber = true
  vim.opt.diffopt = {
    "internal",
    "filler",
    "closeoff",
    "hiddenoff",
    "algorithm:minimal",
  }
  vim.opt.wrap = true
  vim.opt.termguicolors = true
  vim.opt.updatetime = 100
  vim.opt.timeoutlen = 250
  vim.opt.redrawtime = 1500
  vim.opt.ttimeoutlen = 10
  vim.opt.wrapscan = true -- Searches wrap around the end of the file
  -- vim.opt.mousescroll = { "ver:1", "hor:6" }
  vim.o.mousefocus = true
  vim.o.mousemoveevent = true
  vim.o.secure = true -- Disable autocmd etc for project local vimrc files.
  vim.o.exrc = false -- Allow project local vimrc files example .nvimrc see :h exrc
  vim.o.splitkeep = "cursor"
  vim.o.shiftwidth = 4
  vim.o.tabstop = 4
  vim.o.clipboard = ""

  vim.api.nvim_set_keymap("n", "\\h", "<cmd>nohl<cr>", { desc = "No search highlighting" })
  -- vim.api.nvim_set_keymap("n", "ZZ", "<cmd>wqa<cr>", { desc = "Save all and quit" })
  -- vim.api.nvim_set_keymap("n", "ZQ", "<cmd>qa!<cr>", { desc = "Quit without saving" })
  vim.keymap.set("x", "/", "<Esc>/\\%V") -- range search in visual select

  vim.opt.scrolloff = 9999
  vim.opt.shell = "/bin/sh"

  vim.opt.guifont = "FiraCode Nerd Font:h13"
  vim.g.dashboard_enable_session = 0
  vim.g.dashboard_disable_statusline = 1
  vim.opt.pumblend = 10
  vim.opt.joinspaces = false
  vim.opt.list = true
  vim.opt.confirm = true -- make vim prompt me to save before doing destructive things
  vim.opt.autowriteall = true -- automatically :write before running commands and changing files
  vim.opt.wildignore = {
    "*.aux,*.out,*.toc",
    "*.o,*.obj,*.dll,*.jar,*.pyc,__pycache__,*.rbc,*.class",
    -- media
    "*.ai,*.bmp,*.gif,*.ico,*.jpg,*.jpeg,*.png,*.psd,*.webp",
    "*.avi,*.m4a,*.mp3,*.oga,*.ogg,*.wav,*.webm",
    "*.eot,*.otf,*.ttf,*.woff",
    "*.doc,*.pdf",
    -- archives
    "*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz",
    -- temp/system
    "*.*~,*~ ",
    "*.swp,.lock,.DS_Store,._*,tags.lock",
    -- version control
    ".git,.svn",
  }
  vim.opt.shortmess = {
    t = true, -- truncate file messages at start
    A = true, -- ignore annoying swap file messages
    o = true, -- file-read message overwrites previous
    O = true, -- file-read message overwrites previous
    T = true, -- truncate non-file messages in middle
    f = true, -- (file x of x) instead of just (x of x
    F = true, -- Don't give file info when editing a file, NOTE: this breaks autocommand messages
    s = true,
    c = true,
    W = true, -- Don't show [w] or written when writing
  }
  vim.opt.formatoptions = {
    ["1"] = true,
    ["2"] = true, -- Use indent from 2nd line of a paragraph
    q = true, -- continue comments with gq"
    c = true, -- Auto-wrap comments using textwidth
    r = true, -- Continue comments when pressing Enter
    n = true, -- Recognize numbered lists
    t = false, -- autowrap lines using text width value
    j = true, -- remove a comment leader when joining lines.
    -- Only break if the line was not longer than 'textwidth' when the insert
    -- started and only at a white character that has been entered during the
    -- current insert command.
    l = true,
    v = true,
  }
  vim.opt.listchars = {
    eol = nil,
    -- tab = "│ ",
    tab = "  ",
    extends = "›", -- Alternatives: … »
    precedes = "‹", -- Alternatives: … «
    trail = "•", -- BULLET (U+2022, UTF-8: E2 80 A2)
  }
  vim.o.qftf = "{info -> v:lua._G.qftf(info)}"

  -- enable neovim builtin filetype detect
  -- https://neovim.discourse.group/t/introducing-filetype-lua-and-a-call-for-help/1806
  vim.g.do_filetype_lua = true
  vim.g.did_load_filetypes = false

  -- neovim native support editorconfig
  vim.g.editorconfig = true

  local function cursorline()
    -- Cursorline highlighting control
    --  Only have it on in the active buffer
    vim.opt.cursorline = true -- Highlight the current line
    if vim.fn.has("nvim-0.7") == 0 then
      return
    end

    local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
    vim.api.nvim_create_autocmd("WinLeave", {
      group = group,
      callback = function()
        vim.opt_local.cursorline = false
      end,
    })
    vim.api.nvim_create_autocmd("WinEnter", {
      group = group,
      callback = function()
        if vim.bo.filetype == "alpha" then
          return
        end

        vim.opt_local.cursorline = true
      end,
    })
  end

  -- lvim.lsp.automatic_configuration.skipped_filetypes = vim.tbl_filter(function(type)
  -- 	return type ~= "markdown"
  -- end, lvim.lsp.automatic_configuration.skipped_filetypes)
  local function neovide()
    if not vim.g.neovide then
      return
    end

    vim.g.neovide_cursor_animation_length = 0.01
    vim.g.neovide_cursor_trail_length = 0.05
    vim.g.neovide_cursor_antialiasing = true
    vim.g.neovide_remember_window_size = true
    vim.cmd([[set guifont=FiraCode\ Nerd\ Font:h14]])
  end

  local function nvui()
    if not vim.g.nvui then
      return
    end
    -- Configure nvui here
    vim.cmd([[NvuiCmdFontFamily FiraCode Nerd Font]])
    vim.cmd([[set linespace=1]])
    vim.cmd([[set guifont=FiraCode\ Nerd\ Font:h14]])
    vim.cmd([[NvuiPopupMenuDefaultIconFg white]])
    vim.cmd([[NvuiCmdBg #1e2125]])
    vim.cmd([[NvuiCmdFg #abb2bf]])
    vim.cmd([[NvuiCmdBigFontScaleFactor 1.0]])
    vim.cmd([[NvuiCmdPadding 10]])
    vim.cmd([[NvuiCmdCenterXPos 0.5]])
    vim.cmd([[NvuiCmdTopPos 0.0]])
    vim.cmd([[NvuiCmdFontSize 20.0]])
    vim.cmd([[NvuiCmdBorderWidth 5]])
    vim.cmd([[NvuiPopupMenuIconFg variable #56b6c2]])
    vim.cmd([[NvuiPopupMenuIconFg function #c678dd]])
    vim.cmd([[NvuiPopupMenuIconFg method #c678dd]])
    vim.cmd([[NvuiPopupMenuIconFg field #d19a66]])
    vim.cmd([[NvuiPopupMenuIconFg property #d19a66]])
    vim.cmd([[NvuiPopupMenuIconFg module white]])
    vim.cmd([[NvuiPopupMenuIconFg struct #e5c07b]])
    vim.cmd([[NvuiCaretExtendTop 15]])
    vim.cmd([[NvuiCaretExtendBottom 8]])
    vim.cmd([[NvuiTitlebarFontSize 12]])
    vim.cmd([[NvuiTitlebarFontFamily Arial]])
    vim.cmd([[NvuiCursorAnimationDuration 0.1]])
    -- vim.cmd [[NvuiToggleFrameless]]
    vim.cmd([[NvuiOpacity 0.99]])
  end

  local function nvim8()
    if vim.fn.has("nvim-0.8") ~= 1 then
      return
    end

    vim.filetype.add({
      extension = {
        fnl = "fennel",
        wiki = "markdown",
      },
      filename = {
        ["go.sum"] = "gosum",
        ["go.mod"] = "gomod",
      },
      pattern = {
        ["*.tml"] = "gohtmltmpl",
        ["%.env.*"] = "sh",
      },
    })
  end

  local function diagnostic_on_cursor()
    vim.api.nvim_create_autocmd("CursorHold", {
      buffer = bufnr,
      callback = function()
        local opts = {
          focusable = false,
          close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
          border = "rounded",
          source = "always",
          prefix = " ",
          scope = "cursor",
        }
        vim.diagnostic.open_float(nil, opts)
      end,
    })
  end

  local function diagnostic_on_line()
    vim.diagnostic.config({
      virtual_text = false,
    })

    local ns = vim.api.nvim_create_namespace("CurlineDiag")
    vim.opt.updatetime = 100
    vim.api.nvim_create_autocmd("LspAttach", {
      callback = function(args)
        vim.api.nvim_create_autocmd("CursorHold", {
          buffer = args.buf,
          callback = function()
            pcall(vim.api.nvim_buf_clear_namespace, args.buf, ns, 0, -1)
            local hi = { "Error", "Warn", "Info", "Hint" }
            local curline = vim.api.nvim_win_get_cursor(0)[1]
            local diagnostics = vim.diagnostic.get(args.buf, { lnum = curline - 1 })
            local virt_texts = { { (" "):rep(4) } }
            for _, diag in ipairs(diagnostics) do
              virt_texts[#virt_texts + 1] = { diag.message, "Diagnostic" .. hi[diag.severity] }
            end
            vim.api.nvim_buf_set_extmark(args.buf, ns, curline - 1, 0, {
              virt_text = virt_texts,
              hl_mode = "combine",
            })
          end,
        })
      end,
    })
  end

  cursorline()
  nvui()
  nvim8()
  neovide()
  if lvim.user_plugins.edit.lsp.diagnostics.inline_autocmd then
    diagnostic_on_line()
  end
  if lvim.user_plugins.edit.lsp.diagnostics.hover_autocmd then
    lvim.lsp.on_attach_callback = diagnostic_on_cursor()
  end
end

-- credit: https://github.com/nyngwang/NeoZoom.lua
function M.maximize_current_split()
  local cur_win = vim.api.nvim_get_current_win()

  vim.api.nvim_set_var("non_float_total", 0)
  vim.cmd("windo if &buftype != 'nofile' | let g:non_float_total += 1 | endif")
  vim.api.nvim_set_current_win(cur_win or 0)
  if vim.api.nvim_get_var("non_float_total") == 1 then
    if vim.fn.tabpagenr("$") == 1 then
      return
    end
    vim.cmd("tabclose")
  else
    local last_cursor = vim.api.nvim_win_get_cursor(0)
    vim.cmd("tabedit %:p")
    vim.api.nvim_win_set_cursor(0, last_cursor)
  end
end

return M
