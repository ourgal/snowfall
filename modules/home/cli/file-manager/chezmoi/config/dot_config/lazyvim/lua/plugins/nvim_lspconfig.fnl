(let [servers {:ansiblels {:mason false}
               :dhall_lsp_server {:mason false}
               :fennel_ls {:mason false}
               :jsonnet_ls {:mason false}
               :lua_ls {:settings {:Lua {:completion {:callSnippet :Replace}
                                         :workspace {:checkThirdParty false}}}}
               :nil_ls {:mason false}
               :pyright {:mason false}}
      diagnostics {:severity_sort true
                   :underline true
                   :update_in_insert false
                   :virtual_text {:prefix "●" :source :if_many :spacing 4}}
      opts {:capabilities {}
            : diagnostics
            :format {:formatting_options nil :timeout_ms nil}
            :inlay_hints {:enabled false}
            : servers
            :setup {}}
      dependencies [{1 :folke/neoconf.nvim
                     :cmd :Neoconf
                     :config false
                     :dependencies [:nvim-lspconfig]}
                    {1 :folke/neodev.nvim :opts {}}
                    :mason.nvim]
      config (fn [_ opts]
               (let [Util (require :lazyvim.util)]
                 (if (Util.has :neoconf.nvim)
                     (let [conf (require :lazy.core.config)
                           confNeo (. conf.spec.plugins :neoconf.nvim)
                           plug (require :neoconf)
                           lazyPlug (require :lazy.core.plugin)
                           value (lazyPlug.values confNeo :opts false)]
                       (plug.setup value)))
                 (Util.format.register (Util.lsp.formatter)) ; setup autoformat
                 (when (not= opts.autoformat nil) ; deprectaed options
                   (set _G.vim.g.autoformat opts.autoformat)
                   (Util.deprecate :nvim-lspconfig.opts.autoformat
                                   :vim.g.autoformat))
                 (Util.lsp.on_attach (fn [client buffer] ; setup keymaps
                                       (let [keymaps (require :lazyvim.plugins.lsp.keymaps)]
                                         (keymaps.on_attach client buffer))))
                 (let [register-capability (. _G.vim.lsp.handlers
                                              :client/registerCapability)]
                   (tset _G.vim.lsp.handlers :client/registerCapability
                         (fn [err res ctx]
                           (let [ret (register-capability err res ctx)
                                 client-id ctx.client_id
                                 client (_G.vim.lsp.get_client_by_id client-id)
                                 buffer (_G.vim.api.nvim_get_current_buf)
                                 keymaps (require :lazyvim.plugins.lsp.keymaps)]
                             (keymaps.on_attach client buffer)
                             ret))))
                 (let [conf (require :lazyvim.config)]
                   (each [name icon (pairs conf.icons.diagnostics)]
                     (let [texthl (.. :DiagnosticSign name)
                           sign _G.vim.fn.sign_define]
                       (sign name {:numhl "" :text icon : texthl}))))
                 (if opts.inlay_hints.enabled
                     (let [inlay-hint (fn [client buffer]
                                        (let [support (client.supports_method :textDocument/inlayHint)]
                                          (when support
                                            (Util.toggle.inlay_hints buffer
                                                                     true))))]
                       (Util.lsp.on_attach inlay-hint)))
                 (let [virtual-text-is-table (= (type opts.diagnostics.virtual_text)
                                                :table)
                       virtual-text-prefix-is-icons (= opts.diagnostics.virtual_text.prefix
                                                       :icons)
                       old-icons (fn [diagnostic]
                                   (let [conf (require :lazyvim.config)
                                         icons conf.icons.diagnostics]
                                     (each [d icon (pairs icons)]
                                       (let [matched (= diagnostic.severity
                                                        (. _G.vim.diagnostic.severity
                                                           (d:upper)))]
                                         (if matched
                                             icon)))))
                       is-dev-nvim (= (_G.vim.fn.has :nvim-0.10.0) 0)]
                   (if (and virtual-text-is-table virtual-text-prefix-is-icons)
                       (set opts.diagnostics.virtual_text.prefix
                            (if is-dev-nvim "●"
                                old-icons))))
                 (_G.vim.diagnostic.config (_G.vim.deepcopy opts.diagnostics))

                 (fn setup [server]
                   (let [servers (opts.servers)
                         (has-cmp cmp-nvim-lsp) (pcall require :cmp_nvim_lsp)
                         extend _G.vim.tbl_deep_extend
                         capabilities (extend :force {}
                                              (_G.vim.lsp.protocol.make_client_capabilities)
                                              (if has-cmp
                                                  (cmp-nvim-lsp.default_capabilities)
                                                  {})
                                              (or opts.capabilities {}))
                         server-opts (extend :force
                                             {:capabilities (_G.vim.deepcopy capabilities)}
                                             (or (. servers server) {}))
                         plug (require :lspconfig)
                         current-server (. opts.setup server)
                         any-server (. opts.setup "*")
                         get-config Util.lsp.get_config
                         denols-conf (get-config :denols)
                         tsserver-conf (get-config :tsserver)
                         lspconfig-util (require :lspconfig.util)
                         is-deno (lspconfig-util.root_pattern :deno.json
                                                              :deno.jsonc)
                         disable Util.lsp.disable]
                     (if current-server
                         (if (not (current-server server server-opts))
                             ((. (. plug server) :setup) server-opts))
                         any-server
                         (if (not (any-server server server-opts))
                             ((. (. plug server) :setup) server-opts)))
                     (each [server server-opts (pairs servers)]
                       (if server-opts
                           (setup server)))
                     (when (and denols-conf tsserver-conf)
                       (disable :tsserver is-deno)
                       (disable :denols
                                (fn [root-dir]
                                  (not (is-deno root-dir)))))))))]
  {1 :neovim/nvim-lspconfig : config : dependencies :event :LazyFile : opts})
