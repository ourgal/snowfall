;;; plugins/dirvish.el -*- lexical-binding: t; -*-

(after! dirvish
  (dirvish-side-follow-mode))
(map! :n "-" #'dirvish)
(map! :map 'dirvish-mode-map :n "a" #'dired-create-empty-file)
