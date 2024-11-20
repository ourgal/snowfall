local M = {}

-- A shell script static analysis tool.
-- Filetypes: { "sh" }
-- Method: diagnostics
-- Command: shellcheck
-- Args: { "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" }
M.diagnostics = {
  active = false,
  opts = {},
}

-- Provides actions to disable ShellCheck errors/warnings, either for the current line or for the entire file.
-- Filetypes: { "sh" }
-- Method: code_action
-- Command: shellcheck
-- Args: { "--format", "json1", "--source-path=$DIRNAME", "--external-sources", "-" }
M.code_actions = {
  active = false,
  opts = {},
}

return M
