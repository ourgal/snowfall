;;; plugins/persp-mode.el -*- lexical-binding: t; -*-

;; Permanently display workspaces in minibuffer, enable auto save.
(after! persp-mode
	(defun display-workspaces-in-minibuffer ()
	  (with-current-buffer " *Minibuf-0*"
	    (erase-buffer)
	    (insert (+workspace--tabline))))
	(run-with-idle-timer 1 t #'display-workspaces-in-minibuffer)
	(+workspace/display))
