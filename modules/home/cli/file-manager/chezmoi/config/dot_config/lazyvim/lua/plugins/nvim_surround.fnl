(let [help (require :help)
      repo :nvim-surround
      enabled (help.enabled repo :edit :surround)]
  {1 (help.name :kylechui repo) :config true : enabled :event :VeryLazy})
