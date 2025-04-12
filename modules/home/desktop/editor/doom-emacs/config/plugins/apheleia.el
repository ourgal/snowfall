;;; plugins/apheleia.el -*- lexical-binding: t; -*-

;; formatters
(set-formatter! 'prettier-markdown '("prettier" "--parser" "markdown") :modes '(markdown-mode))
(set-formatter! 'shfmt '("shfmt") :modes '(sh-mode))
(set-formatter! 'ruff '("ruff" "format" "-") :modes '(python-mode))
(set-formatter! 'fnlfmt '("fnlfmt" "-") :modes '(fennel-mode))
(set-formatter! 'nixfmt '("nixfmt" "--strict" "-") :modes '(nix-mode))
(set-formatter! 'taplo '("taplo" "fmt" "-") :modes '(conf-toml-mode))
(set-formatter! 'yamlfix '("yamlfix" "-") :modes '(yaml-mode))
