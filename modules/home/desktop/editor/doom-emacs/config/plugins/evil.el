;;; plugins/evil.el -*- lexical-binding: t; -*-

(use-package! evil
  :defer t
  :custom
  (evil-cross-lines t)
  (evil-ex-search-persistent-highlight nil)
  (+evil-want-o/O-to-continue-comments nil)
  (evil-ex-substitute-global t))

(map! :leader
      :prefix "b"
      "q" #'evil-quick-diff
      "Q" #'evil-quick-diff-cancel)

(after! evil-snipe
  (setq evil-snipe-scope 'whole-buffer))
