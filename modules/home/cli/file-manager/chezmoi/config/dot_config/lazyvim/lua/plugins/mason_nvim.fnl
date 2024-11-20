(let [ensure-installed (fn [opts mr]
                         (each [_ tool (ipairs opts.ensure_installed)]
                           (let [p (mr.get_package tool)]
                             (when (not (p:is_installed)) (p:install)))))
      config (fn [_ opts]
               (let [plug (require :mason)
                     handle (fn []
                              (let [event (require :lazy.core.handler.event)
                                    buf (_G.vim.api.nvim_get_current_buf)]
                                (event.trigger {: buf :event :FileType})))
                     defer (fn [f]
                             (_G.vim.defer_fn f 100))
                     mr (require :mason-registry)]
                 (plug.setup opts)
                 (mr:on "package:install:success" (defer handle))
                 (when mr.refresh
                   (mr.refresh (ensure-installed opts mr)))))]
  {1 :williamboman/mason.nvim
   :build ":MasonUpdate"
   :cmd :Mason
   : config
   :keys [{1 :<leader>cm 2 :<cmd>Mason<cr> :desc :Mason}]
   :opts {:ensure_installed {}}})
