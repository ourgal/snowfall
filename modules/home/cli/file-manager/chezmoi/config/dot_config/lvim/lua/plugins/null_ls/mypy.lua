local M = {}

-- Mypy is an optional static type checker for Python that aims to combine the benefits of dynamic (or "duck") typing and static typing.
-- Filetypes: { "python" }
-- Method: diagnostics
-- Command: mypy
-- Args: dynamically resolved (see source)
M.diagnostics = {
  active = false,
  opts = {},
}

return M
