(let [help (require :help)
      repo :vim-cycle
      enabled (help.enabled repo :edit :ca_cx)]
  {1 (help.name :zef repo) : enabled})
