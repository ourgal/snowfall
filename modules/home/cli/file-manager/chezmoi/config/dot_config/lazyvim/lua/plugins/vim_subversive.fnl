(let [help (require :help)
      repo :vim-subversive
      enabled (help.enabled repo :edit)]
  {1 (help.name :svermeulen repo)
   : enabled
   :keys [{1 :r 2 "<plug>(SubversiveSubstitute)" :mode [:n :x]}
          {1 :R 2 :r :mode [:n :x]}]})
