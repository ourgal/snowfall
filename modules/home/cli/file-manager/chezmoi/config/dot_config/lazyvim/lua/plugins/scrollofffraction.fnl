(let [help (require :help)
      repo :scrollofffraction.nvim
      enabled (help.enabled repo :edit)]
  {1 (help.name :nkakouros-original repo)
   :config true
   : enabled
   :event :BufEnter})
