(let [config (fn [_ opts]
               "Fix bufferline when restoring a session"
               (let [callback (fn []
                                (_G.vim.schedule (fn [])
                                                 (pcall :nvim-bufferline)))
                     plug (require :bufferline)]
                 (plug.setup opts
                             (_G.vim.api.nvim_create_autocmd :BufAdd
                                                             {: callback}))))
      close_command (fn [n]
                      (let [mini (require :mini.bufremove)]
                        (mini.delete n false)))
      custom_filter (fn [buf-number _]
                      (let [bufname (_G.vim.fn.bufname buf-number)]
                        (when (not= bufname "[BufExplorer]") true)))
      diagnostics_indicator (fn [_ _ diag]
                              (let [conf (require :lazyvim.config)
                                    icons conf.icons.diagnostics
                                    err (if diag.error
                                            (.. (.. icons.Error diag.error) " ")
                                            "")
                                    warn (if diag.warning
                                             (.. icons.Warn diag.warning)
                                             "")
                                    ret (_G.vim.trim (.. err warn))]
                                ret))
      right_mouse_command (fn [n]
                            (let [mini (require :mini.bufremove)]
                              ((mini.delete n false))))
      help (require :help)
      repo :bufferline.nvim]
  {1 (help.name :akinsho repo)
   : config
   :event :VeryLazy
   :keys [{1 :<leader>bp 2 :<Cmd>BufferLineTogglePin<CR> :desc "Toggle pin"}
          {1 :<leader>bP
           2 "<Cmd>BufferLineGroupClose ungrouped<CR>"
           :desc "Delete non-pinned buffers"}
          {1 :<leader>bo
           2 :<Cmd>BufferLineCloseOthers<CR>
           :desc "Delete other buffers"}
          {1 :<leader>br
           2 :<Cmd>BufferLineCloseRight<CR>
           :desc "Delete buffers to the right"}
          {1 :<leader>bl
           2 :<Cmd>BufferLineCloseLeft<CR>
           :desc "Delete buffers to the left"}
          {1 :<S-h> 2 :<cmd>BufferLineCyclePrev<cr> :desc "Prev buffer"}
          {1 :<S-l> 2 :<cmd>BufferLineCycleNext<cr> :desc "Next buffer"}
          {1 "[b" 2 :<cmd>BufferLineCyclePrev<cr> :desc "Prev buffer"}
          {1 "]b" 2 :<cmd>BufferLineCycleNext<cr> :desc "Next buffer"}]
   :opts {:options {:always_show_bufferline false
                    : close_command
                    : custom_filter
                    :diagnostics :nvim_lsp
                    : diagnostics_indicator
                    :offsets [{:filetype :neo-tree
                               :highlight :Directory
                               :text :Neo-tree
                               :text_align :left}]
                    : right_mouse_command}}})
