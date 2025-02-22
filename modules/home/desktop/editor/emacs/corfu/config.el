(global-corfu-mode)

;; Enable auto completion and configure quitting
(setq corfu-auto t
      corfu-quit-no-match 'separator ;; or t
      corfu-cycle t           ;; Enable cycling for `corfu-next/previous'
      corfu-preselect 'prompt) ;; Always preselect the prompt

(define-key corfu-map (kbd "TAB") 'corfu-next)
(define-key corfu-map (kbd "S-TAB") 'corfu-previous)

;; nerd-icons-corfu
(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)

;; Optionally:
(setq nerd-icons-corfu-mapping
      '((array :style "cod" :icon "symbol_array" :face font-lock-type-face)
        (boolean :style "cod" :icon "symbol_boolean" :face font-lock-builtin-face)
        ;; ...
        (t :style "cod" :icon "code" :face font-lock-warning-face)))
;; Remember to add an entry for `t', the library uses that as default.

;; The Custom interface is also supported for tuning the variable above.
