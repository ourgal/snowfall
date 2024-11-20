(let [help (require :help)
      repo :vim-surround
      enabled (help.enabled repo :edit :surround)]
  {1 (help.name :tpope repo) : enabled})
