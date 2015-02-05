;; key bindings for Mac
(when (eq system-type 'darwin) ;; mac specific settings
  (setq mac-option-modifier 'control)
  (setq mac-command-modifier 'meta)
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete

  ;;for mac
  (set-default-font "-apple-Courier_New-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
  (add-to-list 'default-frame-alist '(font . "-apple-Courier_New-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
  )


;; charset setting
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)


(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'fill-column-indicator)
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.githubusercontent.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

(add-to-list 'el-get-recipe-path "~/.emacs.d/el-get-user/recipes")
(el-get 'sync)

(require 'fill-column-indicator)
(require 'session)
(add-hook 'after-init-hook 'session-initialize)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

;;tell emacs where to find bins
(setq exec-path (cons "/usr/local/bin" exec-path))
;;emacs invoke exclusively
(setq exec-path (cons "~/.emacs.d/bin" exec-path))
;;LOAD_PATH
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/w3")
(add-to-list 'load-path "~/.emacs.d/backup")
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")

;;global key binding
;(global-set-key [(f7)] 'compile)
(global-set-key [(f3)] 'split-window-right)
(global-set-key (kbd "<M-f3>") 'delete-other-windows)
(global-set-key [(f12)] 'other-window)
(global-set-key (kbd "<M-f12>") 'ido-switch-buffer)
(global-set-key [(f11)] 'shell-command)
(global-set-key (kbd "<M-f11>") 'find-grep-dired)
(global-set-key [(f9)] 'undo)

;;global var setting
(setq inhibit-startup-message t)
(column-number-mode t)
(transient-mark-mode t)
(setq line-number-mdoe t)
(setq make-backup-files nil)
(setq fci-rule-column 80)
(tool-bar-mode -1)

(require 'ido)
(ido-mode t)


;(load-file "~/.emacs.d/site-lisp/xcscope.el")
(require 'xcscope)

(load-theme 'tangotango t)

	;(setq cscope-do-not-update-database t)


;;c hook
;; (defun my-c-mode-common-hook()
;;   (setq hs-minor-mode t)
;;   (setq abbrev-mode t)
;;   (setq c-macro-shrik-window-flag t)
;;   (setq c-macro-preprocessor "cpp")
;;   (setq c-macro-prompt-flag t)

;;   (setq default-tab-width 4)
;;   (setq indent-tabs-mod nil)
;;   (setq c-basic-offset 4)
;;   (setq tab-width 4)

;;   (loop for x downfrom 40 to 1 do
;; 		(set q tab-stop-list (cons (* x 4) tab-stop-list)))

;;   (c-toggle-auto-hungry-stat 1)

;;   ;; (define-key c-mode-base-map "<C-\>" 'hs-toggle-hiding)
;;   ;; (define-key c-mode-base-map "<M-\>" 'c-indent-command)
;;   ;; (define-key c-mode-base-map "tab" 'my-indent-or-complete)

;;   (define-key c-mode-base-map "<f7>" 'compile)
;;   (define-key c-mode-base-map "<f8>" 'cscope-find-global-definition)
;;   (define-key c-mode-base-map "<M-f8>" 'cscope-pop-mark)

;;   (c-set-style "stroustrup")
;;   )
;; (add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
										;(add-hook 'c-mode-common-hook 'doxymacs-mode)
;(add-hook 'c-mode-common-hook
;; (add-hook 'c-mode-common-hook
;; 		  '(lambda()
;; 			 (setq hs-minor-mode t)
;; 			 (setq abbrev-mode t)
;; 			 (setq c-macro-shrik-window-flag t)
;; 			 (setq c-macro-preprocessor "cpp")
;; 			 (setq c-macro-prompt-flag t)

;; 			 (setq default-tab-width 4)
;; 			 (setq indent-tabs-mod nil)
;; 			 (setq c-basic-offset 4)
;; 			 (setq tab-width 4)

;; 			 (loop for x downfrom 40 to 1 do
;; 			 	   (set q tab-stop-list (cons (* x 4) tab-stop-list)))

;; ;			 (c-toggle-auto-hungry-stat 1)
;; 			 (c-toggle-auto-newline 1)

;; 			 ;; (define-key c-mode-base-map "<C-\>" 'hs-toggle-hiding)
;; 			 ;; (define-key c-mode-base-map "<M-\>" 'c-indent-command)
;; 			 ;; (define-key c-mode-base-map "tab" 'my-indent-or-complete)

;; 			 (local-set-key (kbd "<f7>") 'compile)
;; 			 (define-key c-mode-base-map [(f8)] 'cscope-find-global-definition)
;; 			 (define-key c-mode-base-map "<M-f8>" 'cscope-pop-mark)

;; 			 (c-set-style "stroustrup")
;; 			 ))

(defun my-c-mode-common-hook()
  (setq tab-width 4 indent-tabs-mode nil)
  (setq c-basic-offset 4) 
  (c-set-style "stroustrup")

  (setq c-set-offset 4)
  ;;; hungry-delete and auto-newline
					;(c-toggle-auto-hungry-state 1)
  ;;按键定义
  (define-key c-mode-base-map [(control \`)] 'hs-toggle-hiding)
					;  (define-key c-mode-base-map [(return)] 'newline-and-indent)
  (define-key c-mode-base-map (kbd "<f7>") 'compile)
  (define-key c-mode-base-map (kbd "<f8>") 'cscope-find-global-definition)
  (define-key c-mode-base-map (kbd "<M-f8>") 'cscope-pop-mark)
  (define-key c-mode-base-map [(meta \`)] 'c-indent-command)
  ;;  (define-key c-mode-base-map [(tab)] 'hippie-expand)
  (define-key c-mode-base-map [(tab)] 'my-indent-or-complete)
  (define-key c-mode-base-map [(meta ?/)] 'semantic-ia-complete-symbol-menu)
  (loop for x downfrom 40 to 1 do
	(set q tab-stop-list (cons (* x 4) tab-stop-list)))

  ;;预处理设置
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-cppflags " ")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
;  (c-set-style "stroustrup")
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)


(add-hook 'c-mode-common-hook
	  '(lambda()
	     (setq hs-minor-mode t)
	     ;; 插入对称的括号
	     (make-variable-buffer-local 'skeleton-pair)
	     (make-variable-buffer-local 'skeleton-pair-on-word)
	     (setq skeleton-pair-on-word t)
	     (setq skeleton-pair t)
	     (make-variable-buffer-local 'skeleton-pair-alist)
	     (setq skeleton-pair-alist  '(  
					  (?\" _ "\"")  
					  (?\' _ "'")  
					  (?\( _ ")")  
					  (?\[ _ "]")  
					  ;;(?\{ _ "}")  
					  (?{ \n > _ \n ?} >)))
	     (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
	     (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
	     (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
	     (local-set-key (kbd "`") 'skeleton-pair-insert-maybe)
	     (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe)

		 (define-key c-mode-base-map (kbd "<f7>") 'compile)
	     ))
