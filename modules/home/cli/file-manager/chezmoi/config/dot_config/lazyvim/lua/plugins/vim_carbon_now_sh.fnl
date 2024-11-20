(let [help (require :help)
      repo :vim-carbon-now-sh
      enabled (help.enabled repo :share)]
  {1 (help.name :kristijanhusak repo)
   :cmd :CarbonNowSh
   : enabled
   :keys [{1 "<leader>,sc"
           2 :<cmd>CarbonNowSh<cr>
           :desc :Carbon
           :mode :v
           :silent true}]})
