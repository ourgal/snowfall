(let [help (require :help)
      repo :vim-zoom
      enabled (help.enabled repo :edit)]
  {1 (help.name :dhruvasagar repo)
   :keys {1 {1 :<C-w>z 2 "<Plug>(zoom-toggle)" :desc :Zoom} : enabled}})
