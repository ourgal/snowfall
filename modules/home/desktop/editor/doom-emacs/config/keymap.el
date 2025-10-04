;;; keymap.el -*- lexical-binding: t; -*-

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

(map! :n "g Z" #'zoxide-find-file)
