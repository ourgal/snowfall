(let [help (require :help)
      repo :vim-floaterm
      enabled (help.enabled repo)]
  {1 (help.name :voldikss repo)
   :cmd [:FloatermNew :FloatermToggle]
   : enabled
   :init (fn []
           (let [env _G.vim.g]
             (set env.floaterm_opener :edit)
             (set env.floaterm_height 0.99)
             (set env.floaterm_width 0.99)
             (set env.floaterm_shell :$SHELL)))
   :keys [{1 :<leader>e 2 "<cmd>FloatermNew lf<cr>" :desc :Lf}
          [:<F12> :<cmd>FloatermToggle<cr> :FloatermToggle]
          {1 :<F12> 2 "<C-\\><C-n>:FloatermToggle<CR>" :mode :t :silent true}]})
