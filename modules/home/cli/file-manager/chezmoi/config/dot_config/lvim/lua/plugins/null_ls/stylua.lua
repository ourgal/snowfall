local M = {}

-- An opinionated code formatter for Lua.
-- Filetypes: { "lua", "luau" }
-- Methods: formatting, range_formatting
-- Command: stylua
-- Args: dynamically resolved (see source)
M.formatting = {
  active = true,
  opts = {},
}
return M
