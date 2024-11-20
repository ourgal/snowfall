local M = {}

-- Injects actions to fix ESLint issues or ignore broken rules. Like ESLint, but faster.
-- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
-- Method: formatting
-- Command: eslint_d
-- Args: { "--fix-to-stdout", "--stdin", "--stdin-filename", "$FILENAME" }
M.formatting = {
  active = false,
  opts = {
    condition = function(utils)
      return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
    end,
    prefer_local = "node_modules/.bin",
  },
}

-- Like ESLint, but faster.
-- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
-- Method: diagnostics
-- Command: eslint_d
-- Args: { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" }
M.diagnostics = {
  active = false,
  opts = {
    condition = function(utils)
      return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
    end,
    prefer_local = "node_modules/.bin",
  },
}

-- Injects actions to fix ESLint issues or ignore broken rules. Like ESLint, but faster.
-- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }
-- Method: code_action
-- Command: eslint_d
-- Args: { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" }
-- nls.builtins.code_actions.eslint_d.with({
-- }),
M.code_actions = {
  active = true,
  opts = {
    condition = function(utils)
      return utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
    end,
    prefer_local = "node_modules/.bin",
  },
}

return M
