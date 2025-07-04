;;; plugins/eglot.el -*- lexical-binding: t; -*-

(after! eglot
  (add-to-list 'eglot-server-programs
               '(fennel-mode . ("fennel-ls")))
  (add-hook 'fennel-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs
               '(fish-mode . ("fish-lsp" "start")))
  (add-hook 'fish-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs
               '(just-mode . ("just-lsp")))
  (add-hook 'just-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs
               '(just-ts-mode . ("just-lsp")))
  (add-hook 'just-ts-mode-hook 'eglot-ensure)
  (add-to-list 'eglot-server-programs
               '(makefile-gmake-mode . ("make-language-server")))
  (add-hook 'makefile-gmake-mode-hook 'eglot-ensure)
  (setq lua-lsp-dir (expand-file-name "~/.local/share/lua-language-server/")))
