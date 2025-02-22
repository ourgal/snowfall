(require 'nix-mode)
(add-to-list 'auto-mode-alist '("\\.nix\\'" . nix-mode))
(when (executable-find "nil")
  (add-hook 'nix-mode-hook 'eglot-ensure))
