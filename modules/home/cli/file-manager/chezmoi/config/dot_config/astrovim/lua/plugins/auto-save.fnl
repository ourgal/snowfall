(let [is-normal-mode (fn []
                       (let [mode (. (_G.vim.api.nvim_get_mode) :mode)]
                         (= mode :n)))
      config (fn []
               (let [plug (require :autosave)
                     filters (require :autosave.filters)]
                 (plug.setup {:filters [filters.writeable
                                        filters.not_empty
                                        filters.modified
                                        (filters.custom is-normal-mode)]
                              :plugin {:force true}})))
      help (require :help)
      repo :autosave.nvim
      enabled (help.enabled repo)]
  {1 (help.name :nullishamy repo) : config : enabled})
