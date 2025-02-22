(dirvish-override-dired-mode)
(setq dirvish-mode-line-format
      '(:left (sort symlink) :right (omit yank index)))
(setq dirvish-attributes
      '(nerd-icons file-time file-size collapse subtree-state vc-state git-msg))
;; (setq delete-by-moving-to-trash t)
(setq dired-listing-switches
      "-l --almost-all --human-readable --group-directories-first --no-group")
