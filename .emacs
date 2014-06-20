;;; .emacs --- 
;; 
;; Filename: .emacs
;; Description: .emacs file to use with Emacs 24
;; Author: Liang Zhou
;; Maintainer: 
;; Created: Wed Apr 16 14:05:51 2014 (-0500)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: Wed Apr 16 14:16:42 2014 (-0500)
;;           By: Liang Zhou
;;     Update #: 4
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Commentary: 
;; 
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Change Log:
;; 
;; 
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; 
;;; Code:


;; .emacs

;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-compression-mode t nil (jka-compr))
 '(case-fold-search t)
 '(cua-mode t nil (cua-base)) ;;cua mode is to set C+c and C+v as copy and paste
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify)))
 )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;set foreground color and background color and fontsize
(setq default-frame-alist
      (append
       '(
	 (width             . 150)
	 (height            . 40)
	 (background-color  . "black")
	 (foreground-color  . "green")
	 ;;(mouse-color       . "blue")
	 (cursor-color      . "red")
	 ;;(face-color        . "black")
	 ;;(face-backgound-color  . "#FFFFEEEECCCC")
	 ) 
       default-frame-alist
       )
      )

;;
;; Set font size to 9 pt
(set-face-attribute 'default nil :height 90)


;;
;; Liang's convenience 
;;
;; set emacs to use shift + click to select region
(define-key global-map (kbd "<S-down-mouse-1>") 'ignore) ; turn off font dialog
(define-key global-map (kbd "<S-mouse-1>") 'mouse-set-point)
(put 'mouse-set-point 'CUA 'move)


;;
;; ESS
;;
;;this is turned on by default now through /etc/emacs

;;
;; TRAMP
;;
;; suppose tramp is installed under ~/.emacs.d
(require 'tramp)


;;
;; Ampl mode (GNU Math Prog too)
;;
;; Tell emacs to look in our emacs directory for extensions
(add-to-list 'load-path "/home/lzhou/sys/ampl")

(setq auto-mode-alist
      (cons '("\\.mod$" . ampl-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.dat$" . ampl-mode) auto-mode-alist))
(setq auto-mode-alist
      (cons '("\\.ampl$" . ampl-mode) auto-mode-alist))
(setq interpreter-mode-alist
      (cons '("ampl" . ampl-mode)
            interpreter-mode-alist))
(load "ampl-mode")
;; Enable syntax coloring
(add-hook 'ampl-mode-hook 'turn-on-font-lock)

;; If you find parenthesis matching a nuisance, turn it off by
;; removing the leading semi-colons on the following lines:
;(setq ampl-auto-close-parenthesis nil)
;(setq ampl-auto-close-brackets nil)
;(setq ampl-auto-close-curlies nil)
;(setq ampl-auto-close-double-quote nil)
;(setq ampl-auto-close-single-quote nil)

;;
;; ipython 
;;
;; python module should be installed by default
(require 'python)
(setq
  python-shell-interpreter "ipython"
  python-shell-interpreter-args "--pylab"
  python-shell-prompt-regexp "In \\[[0-9]+\\]: "
  python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
  python-shell-completion-setup-code
    "from IPython.core.completerlib import module_completion"
  python-shell-completion-module-string-code
    "';'.join(module_completion('''%s'''))\n"
  python-shell-completion-string-code
    "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")


;;
;; header2.el (make-header)
;;
;; download header2.el from http://www.emacswiki.org/emacs/header2.el
(add-to-list 'load-path' "~/.emacs.d")
(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)

(autoload 'auto-make-header "header2")
(add-hook 'c-mode-common-hook   'auto-make-header)
(add-hook 'python-mode-hook   'auto-make-header)
(add-hook 'R-mode-hook   'auto-make-header)
(add-hook 'lisp-mode-hook   'auto-make-header)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs ends here
