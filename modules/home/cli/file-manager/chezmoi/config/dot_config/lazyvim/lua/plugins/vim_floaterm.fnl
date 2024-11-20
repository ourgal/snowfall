(let [help (require :help)
      repo :vim-floaterm
      enabled (help.enabled repo :terminal)]
  {1 (help.name :voldikss repo)
   :cmd [:FloatermNew :FloatermToggle]
   : enabled
   :init (fn [] (set _G.vim.g.floaterm_opener :edit)
           (set _G.vim.g.floaterm_height 0.999)
           (set _G.vim.g.floaterm_width 0.99)
           (set _G.vim.g.floaterm_shell :$SHELL))
   :keys [{1 :<leader>e 2 "<cmd>FloatermNew lf<cr>" :desc :Lf}
          [:<F12> :<cmd>FloatermToggle<cr> :FloatermToggle]
          {1 :<F12> 2 "<C-\\><C-n>:FloatermToggle<CR>" :mode :t :silent true}]})
