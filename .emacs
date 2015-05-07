(defconst windowsp
  (eq system-type 'windows-nt)
  )

(defconst linuxp
  (or (eq system-type 'gnu/linux)
      (eq system-type 'linux))
  )

(defconst cygwinp
  (eq system-type 'cygwin)
  )

(defconst macp
  (eq system-type 'darwin)
  )


;; key bindings for Mac
(if macp
    (progn
      (message "Platform is Max OSX")
      (setq mac-option-modifier 'control)
      (setq mac-command-modifier 'meta)
      (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
      (add-to-list 'load-path "~/.emacs.d/el-get/exec-path-from-shell")
      (require 'exec-path-from-shell)
      (exec-path-from-shell-initialize)
      ;;for mac
      (set-default-font 
       "-apple-Courier_New-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1")
      (add-to-list 
       'default-frame-alist 
       '(font . "-apple-Courier_New-medium-normal-normal-*-12-*-*-*-m-0-iso10646-1"))
      ))


(if windowsp
    (progn
      (message "Platform is Winows")
      (setq exec-path (cons "c:\\cygwin64\\bin\\" exec-path))
      (require 'cygwin-mount)
      (cygwin-mount-activate)

      (add-hook 'comint-output-filter-functions 'shell-strip-ctrl-m nil t)
      (add-hook 'comint-output-filter-functions 'comint-watch-for-password-prompt nil t)
      (setq explicit-shell-file-name "bash.exe")
      (setq shell-file-name explicit-shell-file-name)
      ))

(if (or macp linuxp)
    (progn
      ;;tell emacs where to find bins
      (setq exec-path (cons "/usr/local/bin" exec-path))
      ;;emacs invoke exclusively
      (setq exec-path (cons "~/.emacs.d/bin" exec-path))
      ))


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


(require 'session)
(add-hook 'after-init-hook 'session-initialize)
(load "desktop")
(desktop-load-default)
(desktop-save-mode 1)

(require 'doxymacs)

;;LOAD_PATH
(add-to-list 'load-path "~/.emacs.d/site-lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp/w3")
(add-to-list 'load-path "~/.emacs.d/backup")
(add-to-list 'custom-theme-load-path "~/.emacs.d/theme")
(add-to-list 'custom-theme-load-path "/root/.emacs.d/el-get/color-theme-tangotango")

;;global key binding
;(global-set-key [(f7)] 'compile)
(global-set-key (kbd "<f11>") 'split-window-right)
(global-set-key (kbd "<M-f11>") 'delete-other-windows)
(global-set-key (kbd "<f12>") 'other-window)
(global-set-key (kbd "<M-f12>") 'ido-switch-buffer)
(global-set-key (kbd "<f3>") 'shell-command)
(global-set-key (kbd "M-<f3>") 'find-grep-dired)
(global-set-key (kbd "<f9>") 'undo)

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


;;function & hook
(defun auto-pair()
  (interactive)
  (make-local-variable 'skeleton-pair-alist)
  (setq skeleton-pair-alist '(

			      (?\" _ "\"")
			      (?' _ "'")
			      (?\( _ ")")
			      (?\[ _ "]")
			      (?{ \n > _ \n ?} >)))

  (setq skeleton-pair t)
  (local-set-key (kbd "(") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "{") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "'") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "[") 'skeleton-pair-insert-maybe)
  (local-set-key (kbd "\"") 'skeleton-pair-insert-maybe))
(add-hook 'c-mode-hook 'auto-pair)



(defun c-mode-config-hook()
;  (setq default-tab-width 4)
  (setq indent-tabs-mode nil)
  (setq c-basic-offset 4)
  (setq tab-width 4)
  (loop for x downfrom 40 to 1 do
  	(setq tab-stop-list (cons (* x 4) tab-stop-list)))
  (c-toggle-auto-hungry-state 1)
  (define-key c-mode-base-map [(f7)] 'compile)
  (define-key c-mode-base-map (kbd "<f8>") 'cscope-find-global-definition)
  (define-key c-mode-base-map (kbd "<M-f8>") 'cscope-pop-mark)
  (setq c-macro-shrink-window-flag t)
  (setq c-macro-preprocessor "cpp")
  (setq c-macro-prompt-flag t)
  (setq hs-minor-mode t)
  (setq abbrev-mode t)
  (c-set-style "stroustrup"))

(add-hook 'c-mode-common-hook 'c-mode-config-hook)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

(defun my-asm-hook()
  ;; (define-key map [(f8)] 'cscope-find-global-definition)
  (local-set-key (kbd "<f8>") 'cscope-find-global-definition)
  (local-set-key (kbd "<M-f8>") 'cscope-pop-mark)
  )
(add-hook 'asm-mode-hook 'my-asm-hook)

(defun my-doxymacs-font-lock-hook()
  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
      (doxymacs-font-lock))
  (font-lock-add-keywords 'c-mode doxymacs-doxygen-keywords))

(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(doxymacs-doxygen-style "C++")
 '(session-use-package t nil (session)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defconst doxymacs-C++-modify-log-template
  '("///" > n
    "/// " (read-string "Name: " nil nil "jiayw@sugon.com" nil) > n
    "/// " (format-time-string "%Y-%m-%d") > n
    "/// " p > n
    "/// " > n)
  "Customized modify log format.")
doxymacs-C++-modify-log-template



(defun doxymacs-insert-modify-log()
  (interactive)
  (let*
      ((tmp-template (car (read-from-string "doxymacs-C++-modify-log-template"))))
      (beginning-of-buffer)
      (if (re-search-forward "修改记录：\n")
	  (tempo-insert-template tmp-template tempo-insert-region)
	(message "error"))))
