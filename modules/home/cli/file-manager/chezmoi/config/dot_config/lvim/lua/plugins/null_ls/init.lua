local M = {}

M.config = function()
  if not lvim.user_plugins.edit.lsp.null_ls then
    return
  end

  -- NOTE: By default, all null-ls providers are checked on startup.
  -- If you want to avoid that or want to only set up the provider
  -- when you opening the associated file-type,
  -- then you can use filetype plugins for this purpose.
  -- https://www.lunarvim.org/languages/#lazy-loading-the-formatter-setup
  local nls_ok, nls = pcall(require, "null-ls")
  if not nls_ok then
    return
  end

  local diagnostics = nls.builtins.diagnostics
  local code_actions = nls.builtins.code_actions
  local sources = {}

  local ruff = require("plugins.null_ls.ruff")
  sources = M.setup(sources, diagnostics.ruff, ruff.diagnostics)

  local eslint_d = require("plugins.null_ls.eslint_d")
  sources = M.setup(sources, diagnostics.eslint_d, eslint_d.diagnostics)
  sources = M.setup(sources, code_actions.eslint_d, eslint_d.code_actions)

  local mypy = require("plugins.null_ls.mypy")
  sources = M.setup(sources, diagnostics.mypy, mypy.diagnostics)

  local markdownlint = require("plugins.null_ls.markdownlint")
  sources = M.setup(sources, diagnostics.markdownlint, markdownlint.diagnostics)

  local typos_cli = require("plugins.null_ls.typos-cli")
  sources = M.setup(sources, diagnostics.typos, typos_cli.diagnostics)

  local gitsigns = require("plugins.null_ls.gitsigns")
  sources = M.setup(sources, code_actions.gitsigns, gitsigns.code_actions)

  local refactoring = require("plugins.null_ls.refactoring")
  sources = M.setup(sources, code_actions.refactoring, refactoring.code_actions)

  local commitlint = require("plugins.null_ls.commitlint")
  sources = M.setup(sources, diagnostics.commitlint, commitlint.diagnostics)

  local fish = require("plugins.null_ls.fish")
  sources = M.setup(sources, diagnostics.fish, fish.diagnostics)

  local pylama = require("plugins.null_ls.pylama")
  sources = M.setup(sources, diagnostics.pylama, pylama.diagnostics)

  local selene = require("plugins.null_ls.selene")
  sources = M.setup(sources, diagnostics.selene, selene.diagnostics)

  local sqlfluff = require("plugins.null_ls.sqlfluff")
  sources = M.setup(sources, diagnostics.sqlfluff, sqlfluff.diagnostics)

  local ktlint = require("plugins.null_ls.ktlint")
  sources = M.setup(sources, diagnostics.ktlint, ktlint.diagnostics_on_save)

  local typos_ok, typos = pcall(require, "typos")
  if typos_ok then
    table.insert(sources, typos.actions)
    table.insert(sources, typos.diagnostics)
  end

  -- local custom_go_actions = require("plugins.null_ls.go")
  -- local custom_md_hover = require("plugins.null_ls.markdown")
  -- local sources = {
  -- NOTE: npm install -g prettier prettier-plugin-solidity
  -- TODO: try these later on
  -- nls.builtins.formatting.google_java_format,
  -- nls.builtins.code_actions.proselint,
  -- nls.builtins.diagnostics.proselint,
  -- custom_go_actions.gomodifytags,
  -- custom_go_actions.gostructhelper,
  -- custom_md_hover.dictionary,
  -- }
  -- if lvim.builtin.user_refactoring.active then
  -- 	table.insert(
  -- 		sources,
  -- 		nls.builtins.code_actions.refactoring.with({
  -- 			filetypes = { "typescript", "javascript", "lua", "c", "cpp", "go", "python", "java", "php" },
  -- 		})
  -- 	)
  -- end
  -- you can either config null-ls itself
  nls.setup({
    on_attach = require("lvim.lsp").common_on_attach,
    debounce = 150,
    save_after_format = false,
    sources = sources,
  })
end

M.setup = function(sources, default, user_config)
  if user_config.active then
    table.insert(sources, default.with(user_config.opts))
  end
  return sources
end

return M
