;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;; (setq doom-font (font-spec :family "Fira Code" :size 14 :weight 'semi-light)
;; doom-variable-pitch-font (font-spec :family "Fira Sans" :size 15))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-tokyo-night)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(setq user-full-name "zxc")

(setq-default window-combination-resize t
              x-stretch-cursor t)

(setq word-wrap-by-category t)

(global-subword-mode t)

;; set default shell to bash
(setq shell-file-name (executable-find "bash"))

;; set font
(setq +main-font "Fira Code")

(setq doom-font (font-spec :family "monospace" :size 18)
      doom-variable-pitch-font (font-spec :family "sans-serif" :size 19))

(setq doom-themes-enable-bold t
      doom-themes-enable-italic t)

;; enable word-wrap (almost) everywhere
(+global-word-wrap-mode +1)

(setq select-enable-clipboard nil)

;; time tracking
(add-hook! 'after-save-hook 'git-time-metric-record)

;; make script executable
(add-hook! 'after-save-hook #'executable-make-buffer-file-executable-if-script-p)

(add-hook! 'completion-at-point-functions #'cape-dabbrev)
(add-hook! 'completion-at-point-functions #'cape-file)

;; The filename in the mode line occupies way too much space.
(after! doom-modeline
  (setq doom-modeline-buffer-file-name-style 'relative-to-project))

;; set grammar language-tool jar path
(setq langtool-language-tool-jar (expand-file-name "~/.nix-profile/share/languagetool-commandline.jar"))

(setq package-archives '(("gnu"    . "https://mirrors.sjtug.sjtu.edu.cn/docs/emacs-elpa/gnu/")
                         ("nongnu" . "https://mirrors.sjtug.sjtu.edu.cn/docs/emacs-elpa/nongnu/")
                         ("melpa"  . "https://mirrors.sjtug.sjtu.edu.cn/docs/emacs-elpa/melpa/")))

;; fw projectile file
(setq projectile-known-projects-file (expand-file-name "~/.emacs.d/projectile-bookmarks.eld"))

(load! "keymap")

(load! "plugins/vimrc-mode")
(load! "plugins/super-save")
(load! "plugins/persp-mode")
(load! "plugins/apheleia")
(load! "plugins/nov")
(load! "plugins/dirvish")
(load! "plugins/eglot")
(load! "plugins/fzf")
(load! "plugins/catppuccin")
(load! "plugins/rotate-text")
(load! "plugins/rainbow-delimiters")
;; (load! "plugins/codeium")
(load! "plugins/make")
(load! "plugins/parinfer-rust-mode")
;; (load! "plugins/highlight-indent-guides")
(load! "plugins/eglot-booster")
(load! "plugins/perltidy")
(load! "plugins/move-text")
;; (load! "plugins/elfeed")
;; (load! "plugins/miniflux")
(load! "plugins/pangu-spacing")
(load! "plugins/magit-todos")
(load! "plugins/magit-delta")
(load! "plugins/magit-stats")
(load! "plugins/nftables-mode")
(load! "plugins/pass")
(load! "plugins/alert")
(load! "plugins/annotate")
(load! "plugins/dotenv-mode")
(load! "plugins/evil")
(load! "plugins/zeal-at-point")
(load! "plugins/just-mode")
