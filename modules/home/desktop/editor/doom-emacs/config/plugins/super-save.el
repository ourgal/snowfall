;;; plugins/super-save.el -*- lexical-binding: t; -*-

;; auto save
(use-package! super-save
	      :after persp-mode
	      :config
	      (super-save-mode)
	      (setq super-save-silent t))
