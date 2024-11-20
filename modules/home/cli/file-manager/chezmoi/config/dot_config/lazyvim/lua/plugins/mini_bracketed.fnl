(let [help (require :help)
      repo :mini.bracketed
      enabled (help.enabled repo :edit)]
  {1 (help.name :echasnovski repo) :config true :event :VeryLazy : enabled})
