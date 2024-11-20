(let [help (require :help)
      repo :vim-silicon
      enabled (help.enabled repo :share)]
  {1 (help.name :segeljakt repo)
   :cmd :Silicon
   : enabled
   :keys [{1 "<leader>,ss" 2 :<cmd>Silicon<cr> :desc :Silicon}
          {1 "<leader>,ss"
           2 ":'<,'>Silicon<cr>"
           :desc :Silicon
           :mode :v
           :silent true}]})
