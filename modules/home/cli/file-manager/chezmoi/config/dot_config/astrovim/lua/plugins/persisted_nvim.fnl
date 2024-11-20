(let [help (require :help)
      repo :persisted.nvim
      enabled (help.enabled repo)
      should_autosave (fn []
                        (let [ft _G.vim.bo.filetype]
                          (if (or (= ft :alpha) (= ft :lazy)) false true)))]
  {1 (help.name :olimorris repo)
   : enabled
   :opts {:autoload true : should_autosave :silent true}})
