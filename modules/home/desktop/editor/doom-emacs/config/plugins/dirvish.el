;;; plugins/dirvish.el -*- lexical-binding: t; -*-

(after! dirvish
  (dirvish-side-follow-mode))
(map! :n "-" #'dirvish)
