{1 :nvim-lualine/lualine.nvim
 :event :VeryLazy
 :optional true
 :opts (fn [_ opts]
         (table.insert opts.sections.lualine_x 1
                       "vim.fn[\"zoom#statusline\"]()"))}
