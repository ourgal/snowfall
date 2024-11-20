(let [help (require :help)
      repo :carbon-now.nvim
      enabled (help.enabled repo :share)]
  {1 (help.name :ellisonleao repo)
   :cmd :CarbonNow
   :config true
   : enabled
   :keys [{1 "<leader>,sc" 2 :<cmd>CarbonNow<cr> :desc :Carbon}
          {1 "<leader>,sc"
           2 ":'<,'>CarbonNow<cr>"
           :desc :Carbon
           :mode :v
           :silent true}]})
