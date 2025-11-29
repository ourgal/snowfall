;;; waiting_packages.el -*- lexical-binding: t; -*-

(require 'url)
(require 'json)

(defun insert-github-package-snippet ()
  "从系统剪贴板读取 GitHub 仓库 URL，
抓取它的 repo 名和 description，在光标处插入类似：
[\"repo\", \"desc\", \"https://…\", Categories.SYSTEM, \"MM/DD/YYYY\", None, Waiting_Status.WAITING, Types.PACKAGE],"
  (interactive)
  ;; 1. 取剪贴板内容
  (let* ((clip (if (fboundp 'gui-get-selection)
                   (gui-get-selection 'CLIPBOARD)
                 (current-kill 0)))
         (url  (and clip (string-trim clip)))
         ;; 2. 提取 repo 全路径 user/repo 及 repo 名
         (m    (and url (string-match "github\\.com/\\([^/]+/[^/]+\\)" url)))
         (full (and m (match-string 1 url)))
         (repo (and full (file-name-nondirectory full))))
    (unless (and url full repo)
      (user-error "剪贴板中没有有效的 GitHub 仓库 URL"))
    ;; 3. 通过 GitHub API 拉 description
    (let* ((api    (format "https://api.github.com/repos/%s" full))
           ;; 设置一个简单的 User-Agent 以防被拒
           (url-request-extra-headers
            '(("User-Agent" . "emacs-insert-github-package-snippet")))
           (buf    (url-retrieve-synchronously api))
           description)
      (unless buf (user-error "无法访问 GitHub API"))
      (with-current-buffer buf
        (goto-char (point-min))
        (re-search-forward "^$" nil 'move)  ; 跳过 header
        (let ((json-object-type 'alist)
              (json (json-read)))
          (setq description (or (alist-get 'description json) ""))))
      (kill-buffer buf)
      ;; 4. 插入结果
      (insert
       (format "[\"%s\", \"%s\", \"%s\", Categories.SYSTEM, \"%s\", None, Waiting_Status.WAITING, Types.PACKAGE],"
               repo
               ;; 转义双引号
               (replace-regexp-in-string "\"" "\\\\\"" description)
               url
               ;; 用今天的日期
               (format-time-string "%m/%d/%Y"))))))
