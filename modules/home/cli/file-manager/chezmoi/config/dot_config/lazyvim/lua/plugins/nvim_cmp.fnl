(let [dependencies [:hrsh7th/cmp-nvim-lsp
                    :hrsh7th/cmp-buffer
                    :hrsh7th/cmp-path
                    :saadparwaiz1/cmp_luasnip]
      config (fn [_ opts]
               (local plug (require :cmp))
               (each [_ source (ipairs opts.sources)]
                 (set source.group_index (or source.group_index 1)))
               (plug.setup opts))
      format (fn [_ item]
               (let [plug (require :lazyvim.config)
                     icons (plug.icons.kinds)
                     kind (. icons item.kind)]
                 (when kind
                   (set item.kind (.. kind item.kind))))
               item)
      has-words-before (fn []
                         (let [unpack (or unpack table.unpack)
                               (line col) (unpack (_G.vim.api.nvim_win_get_cursor 0))
                               lines (_G.vim.api.nvim_buf_get_lines 0
                                                                    (- line 1)
                                                                    line true)
                               sub (lines.1:sub col col)]
                           (when (not= col 0)
                             (= (sub:match "%s") nil))))
      <S-Tab> (fn [fallback]
                (let [cmp (require :cmp)
                      luasnip (require :luasnip)]
                  (if (cmp.visible) (cmp.select_prev_item)
                      (luasnip.jumpable (- 1)) (luasnip.jump (- 1))
                      (fallback))))
      <Tab> (fn [fallback]
              (let [cmp (require :cmp)
                    luasnip (require :luasnip)]
                (if (cmp.visible) (cmp.select_next_item)
                    (luasnip.expand_or_jumpable) (luasnip.expand_or_jump)
                    (has-words-before) (cmp.complete)
                    (fallback))))
      mapping (let [cmp (require :cmp)]
                (cmp.mapping.preset.insert {:<C-CR> (fn [fallback]
                                                      (cmp.abort)
                                                      (fallback))
                                            :<C-Space> (cmp.mapping.complete)
                                            :<C-b> (cmp.mapping.scroll_docs (- 4))
                                            :<C-e> (cmp.mapping.abort)
                                            :<C-f> (cmp.mapping.scroll_docs 4)
                                            :<C-n> (cmp.mapping.select_next_item {:behavior cmp.SelectBehavior.Insert})
                                            :<C-p> (cmp.mapping.select_prev_item {:behavior cmp.SelectBehavior.Insert})
                                            :<CR> (cmp.mapping.confirm {:select true})
                                            :<S-CR> (cmp.mapping.confirm {:behavior cmp.ConfirmBehavior.Replace
                                                                          :select true})
                                            :<S-Tab> (cmp.mapping <S-Tab>
                                                                  [:i :s])
                                            :<Tab> (cmp.mapping <Tab> [:i :s])}))
      sources (let [cmp (require :cmp)]
                (cmp.config.sources [{:name :nvim_lsp}
                                     {:name :luasnip}
                                     {:name :path}
                                     [{:name :buffer}]]))
      expand (fn [args]
               (let [luasnip (require :luasnip)]
                 (luasnip.lsp_expand args.body)))]
  {1 :hrsh7th/nvim-cmp
   : config
   : dependencies
   :event :InsertEnter
   :opts (fn []
           (let [defaults ((require :cmp.config.default))]
             {:completion {:completeopt "menu,menuone,noinsert"}
              :formatting {: format}
              : mapping
              :snippet {: expand}
              :sorting defaults.sorting
              : sources
              :view {:entries {:follow_cursor true}}}))
   :version false})
