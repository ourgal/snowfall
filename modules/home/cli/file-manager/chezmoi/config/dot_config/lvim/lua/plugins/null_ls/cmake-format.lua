local M = {}

-- Parse cmake listfiles and format them nicely.
-- Filetypes: { "cmake" }
-- Method: formatting
-- Command: cmake-format
-- Args: { "-" }
M.formatting = {
  active = false,
  opts = {},
}
return M
