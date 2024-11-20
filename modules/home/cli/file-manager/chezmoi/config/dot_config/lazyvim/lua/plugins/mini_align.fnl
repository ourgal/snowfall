(let [help (require :help)
      repo :mini.align
      enabled (help.enabled repo :edit :align)]
  {1 (help.name :echasnovski repo)
   : enabled
   :event :VeryLazy
   :opts {:mappinsg {:start :ga :start_with_preview :gA}}})
