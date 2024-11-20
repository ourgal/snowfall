(let [help (require :help)
      repo :neovim-session-manager
      enabled (help.enabled repo :session)
      config (fn []
               (let [conf (require :session_manager.config)
                     plug (require :session_manager)
                     dir_to_session_filename (fn []
                                               (let [Path (require :plenary.path)
                                                     new-dir (os.getenv :PWD)
                                                     path-replacer "__"
                                                     colon-replacer "++"]
                                                 (when new-dir
                                                   (local filename
                                                          (: (new-dir:gsub ":"
                                                                           colon-replacer)
                                                             :gsub Path.path.sep
                                                             path-replacer))
                                                   (: (Path:new conf.sessions_dir)
                                                      :joinpath filename))))]
                 (plug:setup {:autoload_mode conf.AutoloadMode.CurrentDir
                              :autosave_ignore_filetypes [:gitcommit
                                                          :gitrebase
                                                          :alpha
                                                          :lazy]
                              : dir_to_session_filename})))]
  {1 (help.name :Shatur repo)
   : config
   :dependencies :nvim-lua/plenary.nvim
   : enabled})
