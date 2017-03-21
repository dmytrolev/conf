; (add-to-list 'load-path "/home/dima/.emacs.d/")

;;;;; Install Source Code Pro fonts before adding this config
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-12" ))
;; (set-face-attribute 'default t :font "Source Code Pro-12" )

;; Mozilla RUST packages
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(view-highlight-face (quote highlight)))
 
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(match ((((class color) (min-colors 8) (background dark)) (:background "blue" :foreground "red"))))
 '(whitespace-indentation ((t nil)))
 '(whitespace-space ((((class color) (background dark)) nil) (((class color) (background light)) nil) (t (:inverse-video t)))))

;; (require 'actionscript-mode)
;; (require 'lua2-mode)
;; (require 'linum)

;;;;;;; Use package-list-packages to install js3-mode.
;;;;;;; Your will need melpa repository to find these.
;; (add-to-list 'auto-mode-alist '("\\.js$" . js3-mode))
;; (add-to-list 'auto-mode-alist '("\\.json$" . js3-mode))

;; (add-to-list 'auto-mode-alist '("\\.as$" . actionscript-mode))
;; (add-to-list 'auto-mode-alist '("^Rakefile(\\..*)?$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.ru$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
;; (add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'auto-mode-alist '("\\.hbs$" . html-mode))
(add-to-list 'auto-mode-alist '("\\.less$" . css-mode))

;;;;;;; Use package-list-packages to install sass-mode.
;; (add-to-list 'auto-mode-alist '("\\.scss$" . sass-mode))

(set-foreground-color "#dbdbdb")
(set-background-color "#111111")
(set-cursor-color "#ff0000")

(setq-default tab-width 2)

;;;;;;;;;;;;;;;;;;;;
;; set up unicode
(prefer-coding-system       'utf-8-unix)
(set-default-coding-systems 'utf-8-unix)
(set-terminal-coding-system 'utf-8-unix)
(set-keyboard-coding-system 'utf-8-unix)
;; This from a japanese individual.  I hope it works.
(setq default-buffer-file-coding-system 'utf-8-unix)
;; From Emacs wiki
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))
;; MS Windows clipboard is UTF-16LE
;; (set-clipboard-coding-system 'utf-16le-dos)

;; (defun my_msg()
;;   (interactive)
;;   (setq output (get-buffer-create "make"))
;;   (setq currb (buffer-name))
;;   (set-buffer output)
;;   (erase-buffer)
;;   (set-buffer currb)
;;   (start-process "make" output "make" "start")
;;   (display-buffer output)
;; )

;; (global-set-key (kbd "M-<f5>") 'my_msg)

(global-set-key "\C-h" 'delete-backward-char)
(global-set-key "\M-h" 'backward-kill-word)

(setq backup-directory-alist `(("." . "~/.saves")))

(require 'whitespace)

;; (setq-default indent-tabs-mode nil)

(add-to-list 'hs-special-modes-alist
             '(ruby-mode
               "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
               (lambda (arg) (ruby-end-of-block)) nil))

(defun set-good-edit ()
  (setq c-basic-offset 2)
  (flyspell-prog-mode)
  (hs-minor-mode)
  (whitespace-mode)
  (if (fboundp 'company-mode) (company-mode))
  (setq indent-tabs-mode nil) ; some needs to be overriden
)
;; (add-hook 'java-mode-hook         'set-good-edit)

(add-hook 'c-mode-common-hook     'set-good-edit)
(add-hook 'emacs-lisp-mode-hook   'set-good-edit)
(add-hook 'ruby-mode-hook         'set-good-edit)
(add-hook 'lisp-mode-hook         'set-good-edit)
(add-hook 'perl-mode-hook         'set-good-edit)
(add-hook 'sh-mode-hook           'set-good-edit)
(add-hook 'js3-mode-hook          'set-good-edit)
(add-hook 'html-mode-hook         'set-good-edit)
(add-hook 'css-mode-hook          'set-good-edit)
(add-hook 'sass-mode-hook         'set-good-edit)

(server-mode)
