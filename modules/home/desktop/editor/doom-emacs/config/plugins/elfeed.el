;;; plugins/elfeed.el -*- lexical-binding: t; -*-

(after! elfeed
  (elfeed-org)
  (setq rmh-elfeed-org-files (list "~/.config/elfeed/config.org")))
