;; -*- lexical-binding: t; -*-

(after! gt
  (setq! gt-default-translator
         (gt-translator
          :taker   (gt-taker :langs '(en zh) :text 'buffer :pick 'paragraph)
          :engines  (gt-bing-engine)
          :render  (gt-posframe-pop-render))))
