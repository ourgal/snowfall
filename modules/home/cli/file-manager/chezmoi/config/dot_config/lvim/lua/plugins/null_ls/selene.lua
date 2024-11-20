local M = {}

-- Command line tool designed to help write correct and idiomatic Lua code.
-- Filetypes: { "lua", "luau" }
-- Method: diagnostics
-- Command: selene
-- Args: { "--display-style", "quiet", "-" }
M.diagnostics = {
  active = true,
  opts = {},
}

return M
