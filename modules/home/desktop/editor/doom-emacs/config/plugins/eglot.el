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
  (setq lua-lsp-dir (expand-file-name "~/.local/share/lua-language-server/")))
