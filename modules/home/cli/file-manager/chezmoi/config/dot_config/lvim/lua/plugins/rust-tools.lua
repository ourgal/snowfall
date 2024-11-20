local M = {}

local function dir_exists(file)
  local ok, _, code = os.rename(file, file)
  if not ok then
    if code == 13 then
      -- Permission denied, but it exists
      return true
    end
  end
  return ok
end

return {
  "simrat39/rust-tools.nvim",
  dependencies = { "neovim/nvim-lspconfig" },
  lazy = true,
  ft = { "rust", "rs" },
  config = function()
    local opts = {
      tools = {
        executor = require("rust-tools/executors").termopen, -- can be quickfix or termopen
        reload_workspace_from_cargo_toml = true,
        inlay_hints = {
          auto = not lvim.user_plugins.edit.lsp.hints.inlay,
          only_current_line = false,
          show_parameter_hints = true,
          parameter_hints_prefix = "<-",
          other_hints_prefix = "=>",
          max_len_align = false,
          max_len_align_padding = 1,
          right_align = false,
          right_align_padding = 7,
          highlight = "Comment",
        },
        hover_actions = {
          border = {
            { "╭", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╮", "FloatBorder" },
            { "│", "FloatBorder" },
            { "╯", "FloatBorder" },
            { "─", "FloatBorder" },
            { "╰", "FloatBorder" },
            { "│", "FloatBorder" },
          },
          auto_focus = true,
        },
      },
      server = {
        on_attach = require("lvim.lsp").common_on_attach,
        on_init = require("lvim.lsp").common_on_init,
        settings = {
          ["rust-analyzer"] = {
            inlayHints = { locationLinks = false },
          },
        },
      },
    }
    local mason_path = vim.fn.glob(vim.fn.stdpath("data") .. "/mason/packages/codelldb/extension/")
    local vscode_path = vim.fn.expand("~/") .. ".vscode/extensions/vadimcn.vscode-lldb-1.8.1/"

    local path = ""
    local debugger_found = true
    if dir_exists(mason_path) then
      path = mason_path
    elseif dir_exists(vscode_path) then
      path = vscode_path
    else
      debugger_found = false
      vim.notify("please install codelldb using :Mason or via vscode", vim.log.levels.WARN)
    end

    if debugger_found then
      local codelldb_path = path .. "adapter/codelldb"
      local liblldb_path = path .. "lldb/lib/liblldb.so"

      if vim.fn.has("mac") == 1 then
        liblldb_path = path .. "lldb/lib/liblldb.dylib"
      end

      if vim.fn.filereadable(codelldb_path) and vim.fn.filereadable(liblldb_path) then
        opts.dap = {
          adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
        }
      else
        vim.notify("please reinstall codellb, i cannot find liblldb or codelldb itself", vim.log.levels.WARN)
      end
    end
    require("rust-tools").setup(opts)
  end,
  enabled = lvim.user_plugins.language.rust.active,
}
