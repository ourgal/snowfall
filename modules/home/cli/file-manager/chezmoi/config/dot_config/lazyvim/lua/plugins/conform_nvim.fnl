(let [formatters_by_ft {:fennel [:fnlfmt]
                        :fish [:fish_indent]
                        :html [:perttier]
                        :json [:fixjson]
                        :markdown [:mdformat :autocorrect]
                        :nix [:nixfmt]
                        :python [:ruff_fix :ruff_format]
                        :sh [:shfmt]
                        :text [:autocorrect]
                        :yaml [:yamlfmt]
                        :zig [:zigfmt]}
      formatters {:injected {:options {:ignore_errors true}}
                  :ruff_fix {:prepend_args [:--extend-select :I]}}
      defaut_format_opt {:async false :quiet false :timeout_ms 3000}
      opts {: defaut_format_opt : formatters : formatters_by_ft}]
  {1 :stevearc/conform.nvim
   :cmd :ConformInfo
   :dependencies [:mason.nvim]
   :lazy true
   :branch :nvim-0.9
   : opts})
