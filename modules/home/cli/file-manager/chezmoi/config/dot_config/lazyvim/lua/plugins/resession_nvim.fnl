(let [help (require :help)
      repo :resession.nvim
      enabled (help.enabled repo :session)]
  {1 (help.name :stevearc repo)
   : enabled
   :config (fn []
             (let [resession (require :resession)
                   setup resession.setup
                   _load resession.load
                   save resession.save
                   autocmd _G.vim.api.nvim_create_autocmd
                   no_args (-> (_G.vim.fn.argc (- 1)) (= 0))
                   cwd (_G.vim.fn.getcwd)
                   dir :dirsession]
               (setup)
               (autocmd :VimEnter
                        {:callback #(when no_args
                                      (_load cwd {: dir :silence_errors true}))
                         :nested true})
               (autocmd :VimLeavePre
                        {:callback #(save cwd {: dir :notify false})})))})
