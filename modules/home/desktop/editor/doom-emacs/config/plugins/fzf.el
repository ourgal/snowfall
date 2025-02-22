;;; ../../.local/share/syncthing/doom/plugins/fzf.el -*- lexical-binding: t; -*-

(use-package! fzf
  :config
  (setq fzf/args "-x --print-query --margin=1,0 --no-hscroll"
        fzf/executable "fzf"
        fzf/git-grep-args "-i --line-number %s"
        ;; command used for `fzf-grep-*` functions
        ;; example usage for ripgrep:
        ;; fzf/grep-command "rg --no-heading -nH"
        fzf/grep-command "grep -nrH"
        ;; If nil, the fzf buffer will appear at the top of the window
        fzf/position-bottom t
        fzf/window-height 15))

(map! :leader
      :desc "fzf" "f f" #'fzf)
