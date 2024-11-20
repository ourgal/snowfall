local M = {}

local kind = require("configs.lsp_kind")

-- credit: https://github.com/max397574/NeovimConfig/blob/master/lua/configs/lsp/init.lua
M.codes = {
  no_matching_function = {
    message = " Can't find a matching function",
    "redundant-parameter",
    "ovl_no_viable_function_in_call",
  },
  different_requires = {
    message = "󰆑 Buddy you've imported this before, with the same name",
    "different-requires",
  },
  empty_block = {
    message = "󰂕 That shouldn't be empty here",
    "empty-block",
  },
  missing_symbol = {
    message = "󰍉 Here should be a symbol",
    "miss-symbol",
  },
  expected_semi_colon = {
    message = " Remember the `;` or `,`",
    "expected_semi_declaration",
    "miss-sep-in-table",
    "invalid_token_after_toplevel_declarator",
  },
  redefinition = {
    message = "󰁡 That variable was defined before",
    "redefinition",
    "redefined-local",
  },
  no_matching_variable = {
    message = " Can't find that variable",
    "undefined-global",
    "reportUndefinedVariable",
  },
  trailing_whitespace = {
    message = " Remove trailing whitespace",
    "trailing-whitespace",
    "trailing-space",
  },
  unused_variable = {
    message = "󰂭 Don't define variables you don't use",
    "unused-local",
  },
  unused_function = {
    message = "󰂭 Don't define functions you don't use",
    "unused-function",
  },
  useless_symbols = {
    message = " Remove that useless symbols",
    "unknown-symbol",
  },
  wrong_type = {
    message = "󰉺 Try to use the correct types",
    "init_conversion_failed",
  },
  undeclared_variable = {
    message = " Have you delcared that variable somewhere?",
    "undeclared_var_use",
  },
  lowercase_global = {
    message = " Should that be a global? (if so make it uppercase)",
    "lowercase-global",
  },
}

M.default_diagnostic_config = {
  signs = {
    active = true,
    values = {
      { name = "DiagnosticSignError", text = kind.icons.error },
      { name = "DiagnosticSignWarn", text = kind.icons.warn },
      { name = "DiagnosticSignInfo", text = kind.icons.info },
      { name = "DiagnosticSignHint", text = kind.icons.hint },
    },
  },
  virtual_text = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    source = "if_many",
    header = "",
    prefix = "",
    border = {
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
      { " ", "FloatBorder" },
    },
    format = function(d)
      local t = vim.deepcopy(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)
      for _, table in pairs(M.codes) do
        if vim.tbl_contains(table, code) then
          return table.message
        end
      end
      return t.message
    end,
  },
}

M.config = function()
  -- LSP
  -- =========================================
  lvim.lsp.code_lens_refresh = true
  lvim.lsp.installer.setup.automatic_installation = false

  lvim.lsp.on_attach_callback = M.lsp_on_attach_callback
  vim.diagnostic.config(M.default_diagnostic_config)

  if lvim.user_plugins.language.go.gopher and lvim.user_plugins.language.go.debug then
    require("lvim.lsp.manager").setup("golangci_lint_ls", {
      on_init = require("lvim.lsp").common_on_init,
      capabilities = require("lvim.lsp").common_capabilities(),
    })
  end

  --  _
  -- | | _____ _   _ _ __ ___   __ _ _ __
  -- | |/ / _ \ | | | '_ ` _ \ / _` | '_ \
  -- |   <  __/ |_| | | | | | | (_| | |_) |
  -- |_|\_\___|\__, |_| |_| |_|\__,_| .__/
  --           |___/                |_|
  lvim.builtin.which_key.mappings["lm"] = {
    "<cmd>lua require('plugins.telescope').lsp_implementations()<CR>",
    "Goto Implementation",
  }
  lvim.builtin.which_key.mappings["lA"] = {
    "<cmd>lua if vim.bo.filetype == 'rust' then vim.cmd[[RustHoverActions]] else vim.lsp.codelens.run() end<CR>",
    "CodeLens Action",
  }
  lvim.builtin.which_key.mappings["lt"] = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" }
end

M.show_documentation = function()
  local filetype = vim.bo.filetype
  if vim.tbl_contains({ "vim", "help" }, filetype) then
    vim.cmd("h " .. vim.fn.expand("<cword>"))
  elseif vim.fn.expand("%:t") == "Cargo.toml" then
    require("crates").show_popup()
  elseif vim.tbl_contains({ "man" }, filetype) then
    vim.cmd("Man " .. vim.fn.expand("<cword>"))
  else
    vim.lsp.buf.hover()
  end
end

-- function M.pylsp(client)
-- 	local filetype = vim.bo.filetype
-- 	local n = require("null-ls")
-- 	local s = require("null-ls.sources")
-- 	local method = n.methods.FORMATTING
-- 	local available_formatters = s.get_available(filetype, method)

-- 	if #available_formatters > 0 then
-- 		return client.name == "null-ls" or client.name == "pylsp"
-- 	elseif client.supports_method("textDocument/formatting") then
-- 		return true
-- 	else
-- 		return false
-- 	end
-- end

M.lsp_on_attach_callback = function(client, _)
  local wkstatus_ok, which_key = pcall(require, "which-key")
  if not wkstatus_ok then
    return
  end
  local mappings = {}

  local opts = {
    mode = "n",
    prefix = "<leader>",
    buffer = nil,
    silent = true,
    noremap = true,
    nowait = true,
  }
  -- local opts = { noremap = true, silent = true }
  if client.name == "clangd" then
    if lvim.user_plugins.language.cmake then
      mappings["H"] = {
        "<Cmd>ClangdSwitchSourceHeader<CR>",
        "Swich Header/Source",
      }
      mappings["lg"] = { "<cmd>CMakeGenerate<CR>", "Generate CMake" }
      mappings["rm"] = { "<cmd>CMakeRun<CR>", "Run CMake" }
      mappings["mm"] = { "<cmd>CMakeBuild<CR>", "Build CMake" }
      mappings["dm"] = { "<cmd>CMakeDebug<CR>", "Debug CMake" }
      mappings["ms"] = { "<cmd>CMakeSelectBuildType<CR>", "Select Build Type" }
      mappings["mt"] = { "<cmd>CMakeSelectBuildTarget<CR>", "Select Build Target" }
      mappings["rt"] = { "<cmd>CMakeSelectLaunchTarget<CR>", "Select Launch Target" }
      mappings["lo"] = { "<cmd>CMakeOpen<CR>", "Open CMake Console" }
      mappings["lc"] = { "<cmd>CMakeClose<CR>", "Close CMake Console" }
      mappings["mi"] = { "cmd>CMakeInstall<cr>", "Install CMake Targets" }
      mappings["mc"] = { "<cmd>CMakeClean<CR>", "Clean CMake Targets" }
      mappings["rc"] = { "<cmd>CMakeStop<CR>", "Stop CMake" }
    end
  -- elseif client.name == "gopls" then
  -- 	mappings["H"] = {
  -- 		"<Cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='go vet .;read',count=2,direction='float'})<CR>",
  -- 		"Go Vet",
  -- 	}
  -- 	if lvim.builtin.user_gopher.active and lvim.builtin.user_nvim_dap_go.active then
  -- 		mappings["li"] = { "<cmd>GoInstallDeps<cr>", "Install Dependencies" }
  -- 		mappings["lT"] = { "<cmd>GoMod tidy<cr>", "Tidy" }
  -- 		mappings["lt"] = { "<cmd>GoTestAdd<cr>", "Add Test" }
  -- 		mappings["tA"] = { "<cmd>GoTestsAll<cr>", "Add All Tests" }
  -- 		mappings["le"] = { "<cmd>GoTestsExp<cr>", "Add Exported Tests" }
  -- 		mappings["lg"] = { "<cmd>GoGenerate<cr>", "Generate" }
  -- 		mappings["lF"] = { "<cmd>GoGenerate %<cr>", "Generate File" }
  -- 		mappings["lc"] = { "<cmd>GoCmt<cr>", "Comment" }
  -- 		mappings["dT"] = { "<cmd>lua require('dap-go').debug_test()<cr>", "Debug Test" }
  -- 	end
  elseif client.name == "jdtls" then
    mappings["rf"] = {
      "<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn package;read', hidden =false}:toggle()<CR>",
      "Maven Package",
    }
    mappings["mf"] = {
      "<cmd>lua require('toggleterm.terminal').Terminal:new {cmd='mvn compile;read', hidden =false}:toggle()<CR>",
      "Maven Compile",
    }
  elseif client.name == "rust_analyzer" then
    mappings["H"] = {
      "<cmd>lua require('lvim.core.terminal')._exec_toggle({cmd='cargo clippy;read',count=2,direction='float'})<CR>",
      "Clippy",
    }
    if lvim.user_plugins.language.rust.active and lvim.user_plugins.language.rust.crates then
      mappings["lA"] = { "<Cmd>RustHoverActions<CR>", "Hover Actions" }
      mappings["lm"] = { "<Cmd>RustExpandMacro<CR>", "Expand Macro" }
      mappings["lH"] = { "<Cmd>RustToggleInlayHints<CR>", "Toggle Inlay Hints" }
      mappings["le"] = { "<Cmd>RustRunnables<CR>", "Runnables" }
      mappings["lD"] = { "<cmd>RustDebuggables<Cr>", "Debuggables" }
      mappings["lP"] = { "<cmd>RustParentModule<Cr>", "Parent Module" }
      mappings["lv"] = { "<cmd>RustViewCrateGraph<Cr>", "View Crate Graph" }
      mappings["lR"] = {
        "<cmd>lua require('rust-tools/workspace_refresh')._reload_workspace_from_cargo_toml()<Cr>",
        "Reload Workspace",
      }
      mappings["lc"] = { "<Cmd>RustOpenCargo<CR>", "Open Cargo" }
      mappings["lo"] = { "<Cmd>RustOpenExternalDocs<CR>", "Open External Docs" }
    end
  elseif client.name == "taplo" then
    if lvim.user_plugins.language.rust.active and lvim.user_plugins.language.rust.crates then
      mappings["lt"] = { "<Cmd>lua require('crates').toggle()<CR>", "Toggle Crate" }
      mappings["lu"] = { "<Cmd>lua require('crates').update_crate()<CR>", "Update Crate" }
      mappings["lU"] = { "<Cmd>lua require('crates').upgrade_crate()<CR>", "Upgrade Crate" }
      mappings["lg"] = { "<Cmd>lua require('crates').update_all_crates()<CR>", "Update All" }
      mappings["lG"] = { "<Cmd>lua require('crates').upgrade_all_crates()<CR>", "Upgrade All" }
      mappings["lH"] = { "<Cmd>lua require('crates').open_homepage()<CR>", "Open HomePage" }
      mappings["lD"] = { "<Cmd>lua require('crates').open_documentation()<CR>", "Open Documentation" }
      mappings["lR"] = { "<Cmd>lua require('crates').open_repository()<CR>", "Open Repository" }
      mappings["lv"] = { "<Cmd>lua require('crates').show_versions_popup()<CR>", "Show Versions" }
      mappings["lF"] = { "<Cmd>lua require('crates').show_features_popup()<CR>", "Show Features" }
      mappings["lD"] = { "<Cmd>lua require('crates').show_dependencies_popup()<CR>", "Show Dependencies" }
    end
  elseif client.name == "tsserver" then
    mappings["lA"] = { "<Cmd>TSLspImportAll<CR>", "Import All" }
    mappings["lR"] = { "<Cmd>TSLspRenameFile<CR>", "Rename File" }
    mappings["lO"] = { "<Cmd>TSLspOrganize<CR>", "Organize Imports" }
    mappings["li"] = { "<cmd>TypescriptAddMissingImports<Cr>", "AddMissingImports" }
    mappings["lo"] = { "<cmd>TypescriptOrganizeImports<cr>", "OrganizeImports" }
    mappings["lu"] = { "<cmd>TypescriptRemoveUnused<Cr>", "RemoveUnused" }
    mappings["lF"] = { "<cmd>TypescriptFixAll<Cr>", "FixAll" }
    mappings["lg"] = { "<cmd>TypescriptGoToSourceDefinition<Cr>", "GoToSourceDefinition" }
  elseif client.name == "pyright" then
    if lvim.user_plugins.language.python.venv.first and lvim.user_plugins.language.python.debug then
      mappings["df"] = { "<cmd>lua require('dap-python').test_class()<cr>", "Test Class" }
      mappings["dm"] = { "<cmd>lua require('dap-python').test_method()<cr>", "Test Method" }
      mappings["dS"] = { "<cmd>lua require('dap-python').debug_selection()<cr>", "Debug Selection" }
      mappings["P"] = {
        name = "Python",
        i = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Pick Env" },
        d = { "<cmd>lua require('swenv.api').get_current_venv()<cr>", "Show Env" },
      }
    end
  elseif client.name == "jsonls" then
    if lvim.user_plugins.language.typecript and lvim.user_plugins.language.javascript.npm then
      mappings["ls"] = { "<cmd>lua require('package-info').show()<cr>", "Show pkg info" }
      mappings["lc"] = { "<cmd>lua require('package-info').hide()<cr>", "Hide pkg info" }
      mappings["lu"] = { "<cmd>lua require('package-info').update()<cr>", "Update dependency" }
      mappings["ld"] = { "<cmd>lua require('package-info').delete()<cr>", "Delete dependency" }
      mappings["li"] = { "<cmd>lua require('package-info').install()<cr>", "Install dependency" }
      mappings["lC"] = { "<cmd>lua require('package-info').change_version()<cr>", "Change Version" }
    end
    -- elseif client.name == "pylsp" then
    -- 	local opts = {}
    --    opts.filter = M.pylsp
    -- 	mappings["lf"] = { require("lvim.lsp.utils").format(opts), "Format" }
  end

  which_key.register(mappings, opts)
end

return M
