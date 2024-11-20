local M = {}

function M.extend_tbl(default, opts)
  opts = opts or {}
  return default and vim.tbl_deep_extend("force", default, opts) or opts
end

function M.notify(msg, type, opts)
  vim.schedule(function()
    vim.notify(msg, type, M.extend_tbl({ title = "LunarVim" }, opts))
  end)
end

local function mason_notify(msg, type)
  M.notify(msg, type, { title = "Mason" })
end

function M.update_all()
  local registry_avail, registry = pcall(require, "mason-registry")
  if not registry_avail then
    vim.api.nvim_err_writeln("Unable to access mason registry")
    return
  end

  mason_notify("Checking for package updates...")
  registry.update(vim.schedule_wrap(function(success, updated_registries)
    if success then
      local installed_pkgs = registry.get_installed_packages()
      local running = #installed_pkgs
      local no_pkgs = running == 0

      if no_pkgs then
        mason_notify("No updates available")
      else
        local updated = false
        for _, pkg in ipairs(installed_pkgs) do
          pkg:check_new_version(function(update_available, version)
            if update_available then
              updated = true
              mason_notify(("Updating `%s` to %s"):format(pkg.name, version.latest_version))
              pkg:install():on("closed", function()
                running = running - 1
                if running == 0 then
                  mason_notify("Update Complete")
                end
              end)
            else
              running = running - 1
              if running == 0 then
                if updated then
                  mason_notify("Update Complete")
                else
                  mason_notify("No updates available")
                end
              end
            end
          end)
        end
      end
    else
      mason_notify(("Failed to update registries: %s"):format(updated_registries), vim.log.levels.ERROR)
    end
  end))
end

function M.update_packages()
  require("lazy").sync({ wait = true })
  M.update_all()
end

function M.config()
  vim.api.nvim_create_user_command("UpdatePackages", function()
    M.update_packages()
  end, { desc = "Update Plugins and Mason" })
end

return M
