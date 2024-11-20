(let [help (require :help)
      repo :mini.operators
      enabled (help.enabled repo :edit)]
  {1 (help.name :echasnovski repo)
   : enabled
   :event :VeryLazy
   :keys [[:R :r]]
   :opts {:evaluate {:func nil :prefix nil}
          :exchange {:prefix nil :reindent_linewise true}
          :multiply {:func nil :prefix :ym}
          :replace {:prefix :r :reindent_linewise true}
          :sort {:func nil :prefix :gz}}})
