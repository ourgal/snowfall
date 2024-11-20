local M = {}

-- Python utility / library to sort imports alphabetically and automatically separate them into sections and by type.
-- Filetypes: { "python" }
-- Method: formatting
-- Command: isort
-- Args: { "--stdout", "--filename", "$FILENAME", "-" }
-- Base profile type to use for configuration. Profiles include: black, django, pycharm, google, open_stack, plone, attrs, hug, wemake, appnexus. As well as any shared profiles.
M.formatting = {
  active = false,
  opts = { extra_args = { "--profile", "black" } },
}
return M
