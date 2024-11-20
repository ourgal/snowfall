(let [help (require :help)
      repo :toggleterm.nvim
      enabled (help.enabled repo :terminal)]
  {1 (help.name :akinsho repo)
   :config (fn []
             ((. (require :toggleterm) :setup))
             (local Terminal (. (require :toggleterm.terminal) :Terminal))
             (local lf
                    (Terminal:new {:cmd :lf
                                   :dir :git_dir
                                   :direction :float
                                   :float_opts {:border :double}
                                   :on_close #(_G.vim.cmd :startinsert!)
                                   :on_open (fn [term]
                                              (_G.vim.cmd :startinsert!)
                                              (_G.vim.api.nvim_buf_set_keymap term.bufnr
                                                                              :n
                                                                              :q
                                                                              :<cmd>close<CR>
                                                                              {:noremap true
                                                                               :silent true}))}))
             #(lf:toggle)
             (_G.vim.api.nvim_set_keymap :n :<leader>e
                                         "<cmd>lua _lf_toggle()<CR>"
                                         {:noremap true :silent true}))
   : enabled})
