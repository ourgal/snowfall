(let [help (require :help)
      repo :mini.comment
      enabled (help.enabled repo :edit :comment)
      custom_commentstring (fn []
                             (let [intern (require :ts_context_commentstring.internal)]
                               (or (intern.calculate_commentstring)
                                   _G.vim.bo.commentstring)))]
  {1 (help.name :echasnovski repo)
   : enabled
   :event :VeryLazy
   :opts {:mappings {:comment nil
                     :comment_line :<C-c>
                     :comment_visual :<C-c>
                     :textobject :gc}
          :options {: custom_commentstring}}})
