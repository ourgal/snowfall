local M = {}

M.config = function()
  local directory = vim.fn.stdpath("config") .. "/lua/plugins"
  local files = vim.fn.glob(directory .. "/*.lua", false, true)
  for _, file in ipairs(files) do
    local module_name = file:match(".+/(.+)%.lua")
    if module_name ~= "init" then
      local m = require("plugins." .. module_name)
      if m.config ~= nil and type(m[1]) ~= "string" and type(m.url) ~= "string" then
        m.config()
      elseif type(m) == "function" then
        m()
      else
        table.insert(lvim.plugins, m)
      end
    end
  end
  require("plugins.null_ls").config()
end
return M
