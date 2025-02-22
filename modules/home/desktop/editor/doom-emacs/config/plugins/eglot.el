;;; plugins/eglot.el -*- lexical-binding: t; -*-

(after! eglot
	(add-to-list 'eglot-server-programs
		     '(fennel-mode . ("fennel-ls")))
	(add-hook 'fennel-mode-hook 'eglot-ensure)
	(setq lua-lsp-dir (expand-file-name "~/.local/share/lua-language-server/")))
