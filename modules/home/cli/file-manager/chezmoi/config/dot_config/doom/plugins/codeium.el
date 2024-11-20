;;; plugins/nov.el -*- lexical-binding: t; -*-

(use-package! codeium
  :init
  ;; use globally
  (custom-set-variables
   '(codeium/metadata/api_key "***REMOVED***"))
  (add-to-list 'completion-at-point-functions #'codeium-completion-at-point))
