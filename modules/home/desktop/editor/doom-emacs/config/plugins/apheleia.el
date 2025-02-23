;;; plugins/apheleia.el -*- lexical-binding: t; -*-

;; markdown formatter
(set-formatter! 'markdown '("prettier" "--parser" "markdown") :modes '(markdown-mode))
(set-formatter! 'bash '("shfmt") :modes '(sh-mode))
(set-formatter! 'python '("ruff" "format" "-") :modes '(python-mode))
(set-formatter! 'fennel '("fnlfmt" "-") :modes '(fennel-mode))
(set-formatter! 'nix '("nixfmt" "--strict" "-") :modes '(nix-mode))
