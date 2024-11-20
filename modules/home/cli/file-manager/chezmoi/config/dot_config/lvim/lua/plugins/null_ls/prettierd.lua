local M = {}

-- prettier, as a daemon, for ludicrous formatting speed.
-- Filetypes: { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "jsonc", "yaml", "markdown", "markdown.mdx", "graphql", "handlebars" }
-- Method: formatting
-- Command: prettierd
-- Args: { "$FILENAME" }
M.formatting = {
  active = false,
  opts = {
    condition = function(utils)
      return not utils.root_has_file({ ".eslintrc", ".eslintrc.js" })
    end,
    prefer_local = "node_modules/.bin",
  },
}
return M
