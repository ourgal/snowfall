;;; plugins/org-auto-tangle.el -*- lexical-binding: t; -*-

(use-package! org-auto-tangle
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
  :config (setq org-auto-tangle-default t))
