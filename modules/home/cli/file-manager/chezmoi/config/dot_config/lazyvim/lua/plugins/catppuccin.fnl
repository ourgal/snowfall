(let [help (require :help)
      name :catppuccin
      enabled (help.enabled name :colorscheme)]
  {1 (help.name name :/nvim)
   : name
   : enabled
   :opts {:integrations {:aerial true
                         :alpha true
                         :cmp true
                         :colorful_winsep {:color :lavender :enabled true}
                         :dap true
                         :dap_ui true
                         :gitsigns true
                         :illuminate true
                         :indent_blankline true
                         :markdown true
                         :mason true
                         :native_lsp {:enabled true}
                         :neotree true
                         :notify true
                         :semantic_tokens true
                         :symbols_outline true
                         :telescope true
                         :treesitter true
                         :ts_rainbow false
                         :ufo true
                         :which_key true
                         :window_picker true}}})
