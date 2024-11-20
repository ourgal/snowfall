local M = {}

-- A tool for linting and static analysis of Lua code.
-- Filetypes: { "lua" }
-- Method: diagnostics
-- Command: luacheck
-- Args: { "--formatter", "plain", "--codes", "--ranges", "--filename", "$FILENAME", "-" }
M.diagnostics = {
  active = false,
  opts = {},
}

return M
