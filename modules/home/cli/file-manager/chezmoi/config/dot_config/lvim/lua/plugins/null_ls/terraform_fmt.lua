local M = {}

-- The terraform-fmt command rewrites terraform configuration files to a canonical format and style.
-- Filetypes: { "terraform", "tf" }
-- Method: formatting
-- Command: terraform
-- Args: { "fmt", "-" }
M.formatting = {
  active = false,
  opts = {},
}
return M
