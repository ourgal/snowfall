;;; keymap.el -*- lexical-binding: t; -*-

;; switch windows
(map! "C-l" #'evil-window-right)
(map! "C-h" #'evil-window-left)
(map! "C-j" #'evil-window-down)
(map! "C-k" #'evil-window-up)

;; buffer
(map! :n "L" #'next-buffer
      :n "H" #'previous-buffer
      :n "X" #'evil-delete-buffer)

;; window
(map! :n "C-w o" #'delete-other-windows
      :n "C-w z" #'doom/window-enlargen)

;; mpc
(map! :map mpc-mode-map
      :n "y" #'mpc-toggle-single
      :n "z" #'mpc-toggle-shuffle
      :n "p" #'mpc-toggle-play
      :n "RET" #'mpc-select)

(map! :leader
      :desc "Kill other buffers" "b o" #'doom/kill-other-buffers)
(map! :leader
      :desc "Kill other buffers" "b O" nil)

(map! :n "g z" #'zoxide-find-file)
