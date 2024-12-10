(local map _G.vim.keymap.set)

; disable default keymap
(map :t :<esc><esc> "")
(map :n :<leader>fn "")
(map :n :<leader>ft "")
(map :n :<leader>fT "")
(map :n :<leader>qq "")
(map :n :<leader>cr "")
(map :n :<leader>wd "")
(map :n :<leader>ww "")
(map :n :<leader>w- "")
(map :n :<leader>w| "")

(map :n "\\h" :<cmd>nohl<cr> {:desc "No search highlighting"})

; search in visual mode
(map :x "/" "<Esc>/\\%V")

((. (require :config.update_packages) :config))

(map :n "<leader>,u" :<cmd>UpdatePackages<cr> {:desc "Update packages"})

; share.vim
(local config-path (_G.vim.fn.stdpath :config))
(_G.vim.cmd (.. "source " config-path :/lua/config/share.vim))
(map :n "<leader>,sp" :<cmd>Share<cr> {:desc :Pastebin})
(map :v "<leader>,sp" ":'<,'>Share<cr>" {:desc :Pastebin :silent true})

; layzgit
(local Util (require :lazyvim.util))
(map :n :<C-g> (fn []
                 (Util.terminal [:lazygit]
                                {:ctrl_hjkl false
                                 :cwd (Util.root)
                                 :esc_esc false
                                 :size {:height 1 :width 1}}))
     {:desc "Lazygit (root dir)"})

(map :n :<leader>q :<cmd>xa<cr>)

(map :n :<leader>R _G.vim.lsp.buf.rename {:desc :Rename})

(map :n :<M-d> "\"_d")
(map :n :<M-D> "\"_D")
(map :x :<M-D> "\"_D")
(map :n :<M-d><M-d> "\"_dd")
(map :n :<M-c> "\"_c")
(map :n :<M-C> "\"_C")
(map :x :<M-c> "\"_c")
(map :n :<M-c><M-c> "\"_cc")
(map :n :<M-x> "\"_x")
(map :x :<M-x> "\"_x")

(map :n :<tab> :<cmd>tabnext<cr>)
(map :n :<s-tab> "<cmd>tab split<cr>")
(map :n :<m-tab> :<cmd>tabclose<cr>)
