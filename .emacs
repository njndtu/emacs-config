
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes '(tango-dark))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(zoom zoom-window proof-general slime auto-complete irony elpy evil))
 '(safe-local-variable-values
   '((eval let
	   ((unimath-topdir
	     (expand-file-name
	      (locate-dominating-file buffer-file-name "UniMath"))))
	   (setq fill-column 100)
	   (make-local-variable 'coq-use-project-file)
	   (setq coq-use-project-file nil)
	   (make-local-variable 'coq-prog-args)
	   (setq coq-prog-args
		 `("-emacs" "-noinit" "-indices-matter" "-type-in-type" "-w" "-notation-overridden" "-Q" ,(concat unimath-topdir "UniMath")
		   "UniMath"))
	   (make-local-variable 'coq-prog-name)
	   (setq coq-prog-name
		 (concat unimath-topdir "sub/coq/bin/coqtop"))
	   (make-local-variable 'before-save-hook)
	   (add-hook 'before-save-hook 'delete-trailing-whitespace)
	   (modify-syntax-entry 39 "w")
	   (modify-syntax-entry 95 "w")
	   (if
	       (not
		(memq 'agda-input features))
	       (load
		(concat unimath-topdir "emacs/agda/agda-input")))
	   (if
	       (not
		(member
		 '("chimney" "╝")
		 agda-input-user-translations))
	       (progn
		 (setq agda-input-user-translations
		       (cons
			'("chimney" "╝")
			agda-input-user-translations))
		 (setq agda-input-user-translations
		       (cons
			'("==>" "⟹")
			agda-input-user-translations))
		 (agda-input-setup)))
	   (set-input-method "Agda"))))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Apercu Pro" :foundry "CF" :slant normal :weight normal :height 143 :width normal)))))

;; save/restore open files and window for config
(desktop-save-mode 1) ; 0 for off


(global-visual-line-mode t)
;; Cursor makes it thin
(setq-default cursor-type 'bar)
;; make parenthesis show pair
(show-paren-mode 1)
;; evil 
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)
(require 'evil)
(evil-mode 1)
;; shift arrow to move windows
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)

(require 'ac-math) 
(add-to-list 'ac-modes 'latex-mode)   ; make auto-complete aware of `latex-mode`

 (defun ac-LaTeX-mode-setup () ; add ac-sources to default ac-sources
   (setq ac-sources
         (append '(ac-source-math-unicode ac-source-math-latex ac-source-latex-commands)
                 ac-sources))
   )
(add-hook 'LaTeX-mode-hook 'ac-LaTeX-mode-setup)
(global-auto-complete-mode t)
 
(setq ac-math-unicode-in-math-p t)

(global-set-key (kbd "S-<left>")  'windmove-left)
(global-set-key (kbd "S-<right>") 'windmove-right)
(global-set-key (kbd "S-<up>")    'windmove-up)
(global-set-key (kbd "S-<down>")  'windmove-down)

;;elpy
(package-initialize)
(elpy-enable)

    ;; scroll one line at a time (less "jumpy" than defaults)
    
    (setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
    
    (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
    
    (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
    
    (setq scroll-step 1) ;; keyboard scroll one line at a time

;; irony mode
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)

(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;; tramps 
    (setq tramp-default-method "ssh")
;; autocompete 
(ac-config-default)

;; menu bar disable
(menu-bar-mode -1)
(tool-bar-mode -1)

;; setting lisp path 
(setq inferior-lisp-program "/usr/bin/sbcl")
(setq slime-contribs '(slime-fancy))
;; slime keybindings
(global-set-key "\C-c s" 'slime-selector)
(global-set-key "\C-c s" 'slime-selector)




;; eply keybinds
(add-hook 'elpy-mode-hook
    (lambda ()
    (local-unset-key (kbd "M-TAB"))
    (define-key elpy-mode-map (kbd "M-/") 'elpy-goto-definition)))
(add-hook 'elpy-mode-hook
    (lambda ()
    (local-unset-key (kbd "M-TAB"))
    (define-key elpy-mode-map (kbd "M-?") 'pop-tag-mark)))
