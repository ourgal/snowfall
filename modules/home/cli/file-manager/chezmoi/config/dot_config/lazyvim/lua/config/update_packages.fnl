(local M {})
(fn M.extend_tbl [default opts]
  (let [o (or opts {})]
    (if default (_G.vim.tbl_deep_extend :force default o) o)))

(fn M.notify [msg _type opts]
  (let [msg (fn []
              (let [o (M.extend_tbl {:title :LunarVim} opts)]
                (_G.vim.notify msg _type o)))]
    (_G.vim.schedule msg)))

(fn mason-notify [msg _type] (M.notify msg _type {:title :Mason}))

(fn has-updated [pkg]
  (pkg:check_new_version (fn [avaiable version]
                           (if avaiable
                               (do
                                 (mason-notify (: "Updating `%s` to %s" :format
                                                  pkg.name version))
                                 true)
                               false))))

(fn check-update [success updated-registries registry]
  (if success
      (let [installed_pkgs (registry.get_installed_packages)]
        (if (= (length installed_pkgs) 0)
            (mason-notify "No updates available")
            (do
              (var updated false)
              (local res (icollect [_ pkg (ipairs installed_pkgs)]
                           (do
                             (has-updated pkg))))
              (each [_ v (ipairs res)] (when v (set updated true)))
              (if updated (mason-notify "Update Complete")
                  (mason-notify "No updates available")))))
      (mason-notify ((: "Failed to update registries: %s" :format
                        updated-registries) _G.vim.log.levels.ERROR))))

(fn M.update_all []
  (let [(ok? registry) (pcall require :mason-registry)]
    (if ok?
        (do
          (mason-notify "Checking for package updates...")
          (registry.update (_G.vim.schedule_wrap check-update)))
        (_G.vim.api.nvim_err_writeln "Unable to access mason registry"))))

(fn M.update_packages []
  ((. (require :lazy) :sync) {:wait true})
  (M.update_all))

(fn M.config []
  (_G.vim.api.nvim_create_user_command :UpdatePackages
                                       (fn [] (M.update_packages))
                                       {:desc "Update Plugins and Mason"}))

M
