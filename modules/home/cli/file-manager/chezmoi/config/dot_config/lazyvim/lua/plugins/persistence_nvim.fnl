(let [help (require :help)
      repo :persistence.nvim
      enabled (help.enabled repo :session)
      plug (require :persistence)]
  {1 (help.name :folke repo)
   : enabled
   :event :BufReadPre
   :keys [{1 :<leader>qs
           2 (fn []
               (plug.load))
           :desc "Restore Session"}
          {1 :<leader>ql
           2 (fn []
               (plug.load {:last true}))
           :desc "Restore Last Session"}
          {1 :<leader>qd
           2 (fn []
               (plug.stop))
           :desc "Don't Save Current Session"}]
   :opts {:options (_G.vim.opt.sessionoptions:get)}})
