(let [help (require :help)
      repo :nvim-toggler
      enabled (help.enabled repo :edit)]
  {1 (help.name :nguyenvukhang repo) :config true : enabled})
