(require 'orderless)
(setq completion-styles '(orderless basic)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))
;; (setq completion-styles '(orderless basic)
;;       completion-category-overrides '((file (styles basic partial-completion))))
