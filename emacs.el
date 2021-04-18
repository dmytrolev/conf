; (add-to-list 'load-path "/home/dima/.emacs.d/")

;;;;; Install Source Code Pro fonts before adding this config
;; (add-to-list 'default-frame-alist '(font . "Source Code Pro-12" ))
;; (set-face-attribute 'default t :font "Source Code Pro-12" )

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(js-indent-level 2)
 '(typescript-indent-level 2)
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
(setq-default create-lockfiles nil)

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

(defun set-good-ws-edit ()
  (setq whitespace-line-column 120)
  (set-good-edit))

(add-hook 'java-mode-hook         'set-good-ws-edit)
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
(add-hook 'sql-mode-hook          'set-good-edit)
(add-hook 'typescript-mode-hook   'set-good-ws-edit)

(defun ts-base-file-name (file_name)
  "Get base name of the file."
  (setq dir (file-name-directory file_name))
  (setq file (file-name-nondirectory file_name))
  (concat
   dir
   (replace-regexp-in-string "\\.\\(spec\\.ts\\|ts\\|html\\|scss\\)" "" file)))

(defun java-test-file (file_name)
  "Get base name of the file."
  (setq dir (file-name-directory file_name))
  (setq file (file-name-nondirectory file_name))
  (concat
   (replace-regexp-in-string "/main/" "/test/" dir)
   (replace-regexp-in-string "\\.java" "Test.java" file)))

(defun java-impl-file (file_name)
  "Get base name of the file."
  (setq dir (file-name-directory file_name))
  (setq file (file-name-nondirectory file_name))
  (concat
   (replace-regexp-in-string "/test/" "/main/" dir)
   (replace-regexp-in-string "Test\\.java" ".java" file)))

(defun ts-jump-to-impl ()
  "Jump to implementation of the component"
  (interactive)
  (setq current_file_name (buffer-file-name))
  (cond
   ((string-match ".java$" current_file_name)
    (setq file_name (java-impl-file current_file_name)))
   (t (setq file_name (concat (ts-base-file-name current_file_name) ".ts"))))
  (find-file file_name))

(defun ts-jump-to-scss ()
  "Jump to implementation of the component"
  (interactive)
  (setq current_file_name (buffer-file-name))
  (setq file_name (concat (ts-base-file-name current_file_name) ".scss"))
  (find-file file_name))

(defun ts-jump-to-html ()
  "Jump to implementation of the component"
  (interactive)
  (setq current_file_name (buffer-file-name))
  (setq file_name (concat (ts-base-file-name current_file_name) ".html"))
  (find-file file_name))

(defun ts-jump-to-test ()
  "Jump to implementation of the component"
  (interactive)
  (setq current_file_name (buffer-file-name))
  (cond
   ((string-match ".java$" current_file_name)
    (setq file_name (java-test-file current_file_name)))
   (t (setq file_name (concat (ts-base-file-name current_file_name) ".spec.ts"))))
  (find-file file_name))

(global-set-key (kbd "C-x j i") #'ts-jump-to-impl)
(global-set-key (kbd "C-x j s") #'ts-jump-to-scss)
(global-set-key (kbd "C-x j h") #'ts-jump-to-html)
(global-set-key (kbd "C-x j t") #'ts-jump-to-test)

(defun stub-file ()
  "Stubbs basic file structure"
  (interactive)
  (setq current_file_name (buffer-file-name))
  (cond
   ((string-match "Test.java$" current_file_name)
    (insert-file-contents "~/.emacs.d/JUnitTest.java"))
   ((string-match ".component.ts$" current_file_name)
    (insert-file-contents "~/.emacs.d/proto.component.ts"))
   ((string-match ".service.ts$" current_file_name)
    (insert-file-contents "~/.emacs.d/proto.service.ts"))))

(global-set-key (kbd "C-x p") #'stub-file)

;; (server-mode)
