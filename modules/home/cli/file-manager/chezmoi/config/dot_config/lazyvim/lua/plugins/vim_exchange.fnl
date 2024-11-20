(let [help (require :help)
      repo :vim-exchange
      enabled (help.enabled repo :edit)]
  {1 (help.name :tommcdo repo)
   : enabled
   :keys [{1 :cx 2 "<Plug>(Exchange)" :desc :Exchange}
          {1 :X 2 "<Plug>(Exchange)" :desc :Exchange :mode :x}
          {1 :cxc 2 "<Plug>(ExchangeClear)" :desc :ExchangeClear}
          {1 :cxx 2 "<Plug>(ExchangeLine)" :desc :ExchangeLine}]})
