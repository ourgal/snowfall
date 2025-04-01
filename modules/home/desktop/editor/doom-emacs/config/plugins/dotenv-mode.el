;;; plugins/dotenv-mode.el -*- lexical-binding: t; -*-

(use-package! dotenv-mode
  :mode ("\\.env\\.?.*\\'" . dotenv-mode))
