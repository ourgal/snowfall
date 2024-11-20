(let [opt (fn [k v] (tset _G.vim.opt k v))]
  (opt :scrolloff 9999)
  (opt :splitkeep :cursor)
  (opt :wrap true)
  (opt :shiftwidth 4)
  (opt :tabstop 4)
  (opt :grepprg "rg --vimgrep --smart-case --hidden")
  (opt :grepformat "%f:%l:%c:%m")
  (opt :clipboard ""))

(let [ansile-types {:.*/roles/.*.yaml :yaml.ansible
                    :.*/roles/.*.yml :yaml.ansible
                    :.*/tasks/.*.yaml :yaml.ansible
                    :.*/tasks/.*.yml :yaml.ansible}]
  (_G.vim.filetype.add {:pattern ansile-types}))
