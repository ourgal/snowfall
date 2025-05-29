;;; plugins/zeal-at-point.el -*- lexical-binding: t; -*-

(use-package! zeal-at-point)

(map! :leader
      :desc "Zeal" "h z" #'zeal-at-point)
