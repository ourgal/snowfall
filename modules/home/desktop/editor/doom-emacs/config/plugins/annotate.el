;;; plugins/annotate.el -*- lexical-binding: t; -*-

(use-package! annotate
  :commands (annotate-load-annotation-data))

;; Activate annotate-mode in file buffers that have annotations.
(add-hook! find-file
  (let ((file-name (buffer-file-name))
        (annotation-files (mapcar #'car (annotate-load-annotation-data t))))
    (when (and file-name
               (member file-name annotation-files))
      (annotate-mode +1))))

;; The current database for annotations is contained in the file indicated by the variable annotate-file.
(after! annotate
  (setq annotate-file (expand-file-name "annotate" doom-cache-dir)))

;; Blacklist org-mode
(setq annotate-blacklist-major-mode '(org-mode))

;; Add keybindings.
(after! annotate
  (setq annotate-mode-map (make-sparse-keymap))
  (map! :map annotate-mode-map
        :leader
        :prefix ("b a" . "annotate")
        "a" #'annotate-annotate
        "d" #'annotate-delete-annotation
        "s" #'annotate-show-annotation-summary
        "z" #'annotate-save-annotations
        "]" #'annotate-goto-next-annotation
        "[" #'annotate-goto-previous-annotation))
