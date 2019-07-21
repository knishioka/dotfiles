;;; Package
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)

;;; 対応する括弧を光らせる。
(show-paren-mode 1)

;;; 選択部分をハイライト
(transient-mark-mode t)

;;; バックアップファイルを作らない
(setq backup-inhibited t)

;; スタートアップメッセージを非表示
(setq inhibit-startup-message t)

; comment color
(set-face-foreground 'font-lock-comment-face "#cc0000")

; key bind
(global-set-key "\C-h" 'backward-delete-char)

; ruby-electric.el — electric editing commands for ruby files
(add-to-list 'load-path "~/.emacs.d/ruby-electric")
(require 'ruby-electric)
(add-hook 'ruby-mode-hook '(lambda () (ruby-electric-mode t)))

; Rakefile
(setq auto-mode-alist (append '(("\\.rb$" . ruby-mode)
				("[Rr]akefile" . ruby-mode)
				("\\.rake$" . ruby-mode))
			      auto-mode-alist))

;; show unuseful whitespace
(setq-default show-trailing-whitespace t)

;; ruby mode
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

;; limit 79
(add-hook 'python-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("^[^\n]\\{79\\}\\(.*\\)$" 1 font-lock-warning-face t)))))
(add-hook 'ruby-mode-hook
	  (lambda ()
	    (font-lock-add-keywords nil
				    '(("^[^\n]\\{79\\}\\(.*\\)$" 1 font-lock-warning-face t)))))

;; prevent indent tabs
(setq-default indent-tabs-mode nil)
(electric-indent-mode -1)

;; helm
(require 'helm-config)
(helm-mode 1)
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
