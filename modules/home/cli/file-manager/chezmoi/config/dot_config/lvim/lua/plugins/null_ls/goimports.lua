local M = {}

-- Updates your Go import lines, adding missing ones and removing unreferenced ones.
-- Filetypes: { "go" }
-- Method: formatting
-- Command: goimports
-- Args: { "-srcdir", "$DIRNAME" }
M.formatting = {
  active = false,
  opts = {},
}
return M
