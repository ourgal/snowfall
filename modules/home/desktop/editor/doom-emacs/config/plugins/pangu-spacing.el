;;; plugins/pangu-spacing.el -*- lexical-binding: t; -*-

(use-package! pangu-spacing
  :config (add-hook 'markdown-mode-hook 'pangu-spacing-mode))
