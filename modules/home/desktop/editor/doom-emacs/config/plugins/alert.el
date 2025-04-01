;;; plugins/alert.el -*- lexical-binding: t; -*-

(use-package! alert
  :defer t
  :custom
  (alert-default-style (if IS-LINUX 'libnotify 'osx-notifier)))
