local M = {}

-- Linter for Ansible playbooks, roles and collections.
-- Filetypes: { "yaml.ansible" }
-- Method: diagnostics
-- Command: ansible-lint
-- Args: { "-f", "codeclimate", "-q", "--nocolor", "$FILENAME" }
M.diagnostics = {
  active = true,
  opts = {
    condition = function(utils)
      return utils.root_has_file("roles") and utils.root_has_file("inventories")
    end,
  },
}

return M
