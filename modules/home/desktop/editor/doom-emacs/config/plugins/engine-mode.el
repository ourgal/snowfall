;;; engine-mode.el --- Description -*- lexical-binding: t; -*-

(use-package! engine-mode
  :ensure t
  :config
  (engine-mode t)
  (defengine github
             "https://github.com/search?ref=simplesearch&q=%s"
             :keybinding "G")
  (defengine wikipedia
             "https://www.wikipedia.org/search-redirect.php?language=en&go=Go&search=%s"
             :keybinding "w"
             :docstring "Searchin' the wikis.")
  (defengine bing
             "https://cn.bing.com/search?q=%s"
             :keybinding "b"))
