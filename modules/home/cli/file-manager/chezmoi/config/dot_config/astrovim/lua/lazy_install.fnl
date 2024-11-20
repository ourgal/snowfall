(local lazypath
       (or _G.vim.env.LAZY (.. (_G.vim.fn.stdpath :data) :/lazy/lazy.nvim)))

(when (not (or _G.vim.env.LAZY
               ((. (or _G.vim.uv _G.vim.loop) :fs_stat) lazypath)))
  (_G.vim.fn.system [:git
                     :clone
                     "--filter=blob:none"
                     "https://github.com/folke/lazy.nvim.git"
                     :--branch=stable
                     lazypath]))

(_G.vim.opt.rtp:prepend lazypath)

(when (not (pcall require :lazy))
  (_G.vim.api.nvim_echo [[(: "Unable to load lazy from: %s\n" :format lazypath)
                          :ErrorMsg]
                         ["Press any key to exit..." :MoreMsg]]
                        true {})
  (_G.vim.fn.getchar)
  (_G.vim.cmd.quit))
