(let [help (require :help)
      repo :astrocore
      enabled (help.enabled repo)]
  {1 (help.name :AstroNvim repo)
   : enabled
   :opts {:diagnostics {:underline true :virtual_text true}
          :features {:autopairs true
                     :cmp true
                     :diagnostics_mode 3
                     :highlighturl true
                     :large_buf {:lines 10000 :size (* 1024 256)}
                     :notifications true}
          :mappings {:n {:H {1 :<cmd>bp<cr> :desc "Previous buffer"}
                         :L {1 :<cmd>bn<cr> :desc "Next buffer"}
                         :X {1 :<cmd>bd<cr> :desc "Close buffer"}
                         :ZZ {1 :<cmd>xa<cr> :desc "Save and quit"}
                         :ZQ {1 :<cmd>qa!<cr> :desc "Quit without saving"}}}
          :options {:g {}
                    :opt {:number true
                          :relativenumber true
                          :signcolumn :yes
                          :spell false
                          :wrap false}}
          :autocmds {:alpha_autostart false
                     :restore_session [{:callback (fn []
                                                    (let [resession (require :resession)
                                                          argc _G.vim.fn.argc
                                                          no_args (-> (argc (- 1))
                                                                      (= 0))
                                                          cwd (_G.vim.fn.getcwd)]
                                                      (when no_args
                                                        (resession.load cwd
                                                                        {:dir :dirsession
                                                                         :silence_errors true}))))
                                        :desc "Restore previous directory session if neovim opened with no arguments"
                                        :event :VimEnter
                                        :nested true}]}}})
