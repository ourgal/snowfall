(let [help (require :help)
      repo :visual-split.vim
      enabled (help.enabled repo :edit)]
  {1 (help.name :wellle repo)
   : enabled
   :keys [{1 :<c-w>gr
           2 "<Plug>(Visual-Split-Resize)"
           :desc :Visual-Split-Resize}
          {1 :<c-w>gss
           2 "<Plug>(Visual-Split-Split)"
           :desc :Visual-Split-Split}
          {1 :<c-w>gsa
           2 "<Plug>(Visual-Split-SplitAbove)"
           :desc :Visual-Split-SplitAbove}
          {1 :<c-w>gsb
           2 "<Plug>(Visual-Split-SplitBelow)"
           :desc :Visual-Split-SplitBelow}
          {1 :<c-w>gr
           2 "<Plug>(Visual-Split-VSResize)"
           :desc :Visual-Split-Resize
           :mode :x}
          {1 :<c-w>gss
           2 "<Plug>(Visual-Split-VSSplit)"
           :desc :Visual-Split-Split
           :mode :x}
          {1 :<c-w>gsa
           2 "<Plug>(Visual-Split-VSSplitAbove)"
           :desc :Visual-Split-SplitAbove
           :mode :x}
          {1 :<c-w>gsb
           2 "<Plug>(Visual-Split-VSSplitBelow)"
           :desc :Visual-Split-SplitBelow
           :mode :x}]})
