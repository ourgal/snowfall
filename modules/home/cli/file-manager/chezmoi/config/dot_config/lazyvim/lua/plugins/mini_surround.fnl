(let [help (require :help)
      repo :mini.surround
      enabled (help.enabled repo :edit :surround)]
  {1 (help.name :echasnovski repo)
   : enabled
   :opts {:mappings {:add :gza
                     :delete :gzd
                     :find :gzf
                     :find_left :gzF
                     :highlight :gzh
                     :replace :gzr
                     :update_n_lines :gzn}}})
