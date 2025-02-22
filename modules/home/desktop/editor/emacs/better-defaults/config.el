;; utf-8 everywhere
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

;; clean look
(blink-cursor-mode -1)
(scroll-bar-mode -1)
(fringe-mode -1)
(menu-bar-mode -1)
(tool-bar-mode -1)

;; disable auto save
(auto-save-mode -1)

;; FiraCode font
(set-face-attribute 'default nil :family "FiraCode Nerd Font" :height 140)

;; if EDITOR is not set already, set it.
(or (getenv "EDITOR")
    (progn
      (setenv "EDITOR" "emacsclient"
              (setenv "VISUAL" (getenv "EDITOR"))

              ;; if PAGER is not set already, set it
              (or (getenv "PAGER")
		  (setenv "PAGER" "cat")))))

;; C-x C-b to ibuffer
(global-set-key [remap list-buffers] 'ibuffer)

;; enable tab-bar-mode
;; (tab-bar-mode 1)
;; (tab-bar-history-mode 1)

;; line number
(global-display-line-numbers-mode 1)
(column-number-mode 1)
(setq display-line-numbers-type 'relative)

;; CamelCase word
(global-subword-mode 1)

;; disable backup file
(setq make-backup-files nil)

;; auto pair
(electric-pair-mode 1)

;; Enable indentation+completion using the TAB key.
;; `completion-at-point' is often bound to M-TAB.
(tab-always-indent 'complete)
