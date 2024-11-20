(let [help (require :help)
      repo :vim-cycle
      enabled (help.enabled repo :edit)]
  {1 (help.name :zef repo) : enabled})
