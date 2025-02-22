;;; plugins/dirvish.el -*- lexical-binding: t; -*-

(after! parinfer-rust-mode
	(setq parinfer-rust-library-dir "~/.nix-profile/lib/libparinfer_rust.so"))
