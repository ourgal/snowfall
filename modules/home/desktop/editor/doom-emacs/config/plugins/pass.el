;;; plugins/pass.el -*- lexical-binding: t; -*-

(setq password-store-executable (executable-find "gopass")
      auth-source-pass-filename
      (or (getenv "PASSWORD_STORE_DIR")
          (expand-file-name "~/.local/share/gopass/stores/root")))
