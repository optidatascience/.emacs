;;; .emacs --- 
;; 
;; Filename: .emacs
;; Description: .emacs file to use with Emacs 24
;; Author: Liang Zhou
;; Maintainer: 
;; Created: Wed Apr 16 14:05:51 2014 (-0500)
;; Version: 
;; Package-Requires: ()
;; Last-Updated: Thu Nov 17 15:30:56 2016 (-0600)
;;           By: Liang Zhou
;;     Update #: 110
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

;; start server mode to let geeknote work
(server-start)

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
 '(cua-mode t nil (cua-base))
 '(current-language-environment "UTF-8")
 '(default-input-method "rfc1345")
 '(global-font-lock-mode t nil (font-lock))
 '(org-agenda-files (quote ("~/org/kaggle.org" "~/org/personal.org")))
 '(show-paren-mode t)
 '(text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))))

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
;; Keymap
;; this fixes the keymap in screen mode with screen-256color term
;;
(define-key input-decode-map "\e[1;2D" [S-left])
(define-key input-decode-map "\e[1;2C" [S-right])
(define-key input-decode-map "\e[1;2B" [S-down])
(define-key input-decode-map "\e[1;2A" [S-up])
(define-key input-decode-map "\e[1;2F" [S-end])
(define-key input-decode-map "\e[1;2H" [S-home])
(global-set-key [(control h)] 'delete-backward-char)

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
;; mac key switch alt --> cmd
(setq mac-option-modifier 'super)
(setq mac-command-modifier 'meta)


;;
;; Automatic Package Mangement
;;
(require 'package)
;;(add-to-list 'package-archives 
;;    '("marmalade". "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
    '("melpa". "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
    '("org". "http://orgmode.org/elpa/") t)
(package-initialize)

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))
(require 'use-package)

;; 
;; Color theme
;; this is to overide the settings above for colors
;; and to be consistent with using shell or x11
(use-package color-theme  :ensure color-theme)
(require 'color-theme)
(color-theme-initialize)
(if window-system
        (color-theme-calm-forest)
  (color-theme-calm-forest))


;;
;; ESS
;;
;;this is turned on by default now through /etc/emacs
;; customize R-ESS underscore
(use-package ess  :ensure ess)
(require 'ess-site)
(setq ess-S-assign-key (kbd "M--"))
(ess-toggle-S-assign-key t)
(ess-toggle-underscore nil)

;;
;; TRAMP
;;
(use-package tramp
  :ensure tramp)
(require 'tramp)

;;
;; Ampl mode (GNU Math Prog too)
;;
;; Tell emacs to look in our emacs directory for extensions
;; AMPL mode cannot be auto installed.. not in Melpa

(add-to-list 'load-path "~/.emacs.d/ampl-mode/emacs/")

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
;; (setq ampl-auto-close-parenthesis nil)
;; (setq ampl-auto-close-brackets nil)
;; (setq ampl-auto-close-curlies nil)
;; (setq ampl-auto-close-double-quote nil)
;; (setq ampl-auto-close-single-quote nil)

;;
;; ipython 
;;
;; python module should be installed by default
;;
;; (require 'python)
;; (setq
;;   python-shell-interpreter "ipython"
;;   python-shell-interpreter-args "--pylab"
;;   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
;;   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
;;   python-shell-completion-setup-code
;;     "from IPython.core.completerlib import module_completion"
;;   python-shell-completion-module-string-code
;;     "';'.join(module_completion('''%s'''))\n"
;;   python-shell-completion-string-code
;;     "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")

(use-package python-mode      :ensure python-mode)
(setq py-shell-name "ipython")
(setq py-ipython-command-args "--simple-prompt -i")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "--simple-prompt")
(setq-default py-split-windows-on-execute-function 'split-window-horizontally)
(eval-after-load "python-mode"
  '(define-key python-mode-map [(control c) (control n)] 'py-execute-line))
(eval-after-load "python-mode"
  '(define-key python-mode-map [(control meta x)] 'py-execute-region))


;;
;; ipython notebook mode to view remote notebook servers
;;
(use-package ein      :ensure ein)
(require 'ein)


;;
;; header2.el (make-header)
;;
;; download header2.el from http://www.emacswiki.org/emacs/header2.el
;; header2.el is cleaned a bit
;;
(add-to-list 'load-path' "~/.emacs.d")
(autoload 'auto-update-file-header "header2")
(add-hook 'write-file-hooks 'auto-update-file-header)

(autoload 'auto-make-header "header2")
(add-hook 'c-mode-common-hook   'auto-make-header)
(add-hook 'python-mode-hook   'auto-make-header)
(add-hook 'R-mode-hook   'auto-make-header)
(add-hook 'lisp-mode-hook   'auto-make-header)

;;
;; polymode (to work with R markdown .Rmd)
;;
(use-package markdown-mode  :ensure markdown-mode)
(use-package polymode       :ensure polymode)

(autoload 'markdown-mode "markdown-mode"
   "Major mode for editing Markdown files" t)
(require 'poly-R)
(require 'poly-markdown)
;; MARKDOWN
(add-to-list 'auto-mode-alist '("\\.md" . poly-markdown-mode))
;; R modes
(add-to-list 'auto-mode-alist '("\\.Snw" . poly-noweb+r-mode))
;; Remove Rnw for now, as emacs has built-in support for .Rnw
;;(add-to-list 'auto-mode-alist '("\\.Rnw" . poly-noweb+r-mode))
(add-to-list 'auto-mode-alist '("\\.Rmd" . poly-markdown+r-mode))

;;
;; php-mode
;;
(use-package php-mode  :ensure php-mode)
(require 'php-mode)

;; 
;; Ruby on Rails
;;
(use-package flymake-ruby  :ensure flymake-ruby)
(use-package robe          :ensure robe)
(use-package company       :ensure company)
(use-package inf-ruby      :ensure inf-ruby)
(use-package projectile    :ensure projectile)
(use-package projectile-rails :ensure projectile-rails)
(use-package haml-mode     :ensure haml-mode)

(require 'flymake-ruby)
(require 'robe)
(require 'haml-mode)

(global-set-key (kbd "C-c r r") 'inf-ruby)
(global-company-mode t)

(add-hook 'ruby-mode-hook 'flymake-ruby-load)
(add-hook 'ruby-mode-hook 'projectile-mode)
(add-hook 'projectile-mode-hook 'projectile-rails-on)
(add-hook 'ruby-mode-hook 'robe-mode)
(push 'company-robe company-backends)

(add-hook 'haml-mode-hook
	  (lambda ()
	    (setq indent-tabs-mode nil)
	    (define-key haml-mode-map "\C-m" 'newline-and-indent)))
;;
;; ido
;;
;; Display ido results vertically, rather than horizontally
(use-package ido      :ensure ido)
(use-package flx-ido  :ensure flx-ido)

(setq ido-decorations (quote ("\n-> " "" "\n   " "\n   ..." "[" "]" " [No match]" " [Matched]" " [Not readable]" " [Too big]" " [Confirm]")))
(defun ido-disable-line-truncation () (set (make-local-variable 'truncate-lines) nil))
(add-hook 'ido-minibuffer-setup-hook 'ido-disable-line-truncation)
(defun ido-define-keys () ;; C-n/p is more intuitive in vertical layout
  (define-key ido-completion-map (kbd "C-n") 'ido-next-match)
  (define-key ido-completion-map (kbd "C-p") 'ido-prev-match))
(add-hook 'ido-setup-hook 'ido-define-keys)
(ido-mode t)

;; 
;; org mode
;;
(use-package org-plus-contrib  :ensure org-plus-contrib)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-replace-disputed-keys t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(org-babel-do-load-languages
  'org-babel-load-languages
  '((R . t)
    (latex . t)
    (python . t)))
;; disable confirmation to evaluate code
(setq org-confirm-babel-evaluate nil)
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images)   
(add-hook 'org-mode-hook 'org-display-inline-images)   
;; start org-agenda-list after emacs starts
;; for agenda view, turn on Diary and 
(setq org-agenda-include-diary t)
(setq org-agenda-span 'fortnight)
(setq inhibit-splash-screen t)
(org-agenda-list)
(delete-other-windows)

;;
;; Geeknote: to work with Evernote
;;
(use-package geeknote  :ensure geeknote)
(setq geeknote-command "geeknote")

;; 
;; finally, load personal settings
;;
(add-to-list 'load-path "~/.emacs.d/lisp-personal")





;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; .emacs ends here
