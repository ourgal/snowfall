(require 'evil)
(evil-mode 1)

(evil-define-key 'normal 'global
		 (kbd "C-l") #'evil-window-right
		 (kbd "C-h") #'evil-window-left
		 (kbd "C-j") #'evil-window-down
		 (kbd "C-k") #'evil-window-up
		 "-" #'dired-jump)

(evil-define-key 'normal dired-mode-map
		 "-" 'dired-up-directory
		 "a" 'find-file)

(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")

(evil-leader/set-key
 "e" 'find-file
 "b" 'switch-to-buffer
 "k" 'kill-buffer)
