local M = {}

-- Prettier is an opinionated code formatter. It enforces a consistent style by parsing your code and re-printing it with its own rules that take the maximum line length into account, wrapping code when necessary.
-- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" }
-- Methods: formatting, range_formatting
-- Command: prettier
-- Args: dynamically resolved (see source)
M.formatting = {
  active = true,
  opts = {
    filetypes = { "solidity", "css" },
    timeout = 10000,
  },
}
return M
