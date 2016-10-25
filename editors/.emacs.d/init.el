;;; init --- My Emacs config
;;;
;;; Copyright (c) 2016 Nicholas Scheurich
;;;
;;; Commentary:
;;;
;;; There be dragons here.
;;;
;;; License:
;;;
;;; This program is free software: you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation, either version 3 of the License, or
;;; (at your option) any later version.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program.  If not, see <http://www.gnu.org/licenses
;;;
;;; Code:


;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)

(add-to-list
 'package-archives
 '("MELPA" . "https://melpa.org/packages/") t)
(package-initialize)

(use-package evil
  :ensure t
  :config (evil-mode 1))

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :config (global-flycheck-mode))

(defvar linum-relative-format)
(use-package linum-relative
  :ensure t
  :diminish linum-relative-mode
  :init (setq linum-relative-format "%4s ")
  :config (linum-relative-global-mode))

(use-package exec-path-from-shell
  :ensure t
  :config (exec-path-from-shell-initialize))

(use-package undo-tree
  :diminish undo-tree-mode)

(use-package yaml-mode
  :ensure t
  :mode "\\.yml\\'")

(use-package php-mode
  :ensure t
  :mode "\\.php\\'")

(use-package ag
  :ensure t)

(use-package helm-ag
  :ensure t)

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config (which-key-mode 1))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config (smartparens-mode 1))

(use-package zerodark-theme
  :ensure t
  :config (progn
	    (load-theme 'zerodark t)
	    (custom-theme-set-faces
	     'zerodark
	     '(mode-line ((t (:height 1.0))))
	     '(linum ((t (:background "#22252c"))))
	     '(fringe ((t (:background "#282c34")))))))

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-helm-mode)
  (spaceline-compile
   'ngs
   ;; Left segment
   '((window-number)
     (buffer-modified buffer-size buffer-id)
     major-mode
     (process :when active)
     ((flycheck-error flycheck-warning flycheck-info)
      :when active)
     version-control
     (minor-modes :when active))
   ;; Right segment
   '((buffer-encoding-abbrev "|" line-column)
     buffer-position))
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ngs)))))

(setq powerline-default-separator 'nil)

(set-face-attribute 'mode-line nil :height 1.0)
(set-face-attribute 'modeline-inactive nil :height 1.0)

(set-face-attribute 'mode-line nil :box '(:line-width 4 :color "#1c1e22"))
(set-face-attribute 'mode-line nil :background "#1c1e22")
(set-face-attribute 'powerline-active1 nil :background "#1c1e22")
(set-face-attribute 'powerline-active2 nil :background "#1c1e22")

(set-face-attribute 'modeline-inactive nil :box '(:line-width 4 :color "grey16"))
(set-face-attribute 'modeline-inactive nil :background "grey16")
(set-face-attribute 'powerline-inactive1 nil :background "grey16")
(set-face-attribute 'powerline-inactive2 nil :background "grey16")

(use-package company
  :ensure t
  :diminish company-mode
  :defer t
  :init (add-hook 'after-init-hook 'global-company-mode))

(use-package helm
  :ensure t
  :defer t
  :init (defvar helm-M-x-fuzzy-match)
  :config (progn
	    (require 'helm-config)
	    (global-set-key (kbd "M-x") 'helm-M-x)
	    (setq helm-M-x-fuzzy-match t)))

(use-package window-numbering
  :ensure t
  :config (progn
	    (defun window-numbering-install-mode-line (&optional position)
	      "Do nothing.")
	    (window-numbering-mode 1)))

(use-package projectile
  :ensure t
  :diminish projectile-mode
  :config (progn
	    (projectile-mode)
	    (setq projectile-completion-system 'helm)))
(use-package helm-projectile
  :ensure t
  :config (helm-projectile-on))

(ido-mode 1)
(use-package ido-vertical-mode
  :ensure t
  :config (ido-vertical-mode 1))

(use-package smex
  :ensure t
  :config (smex-initialize))

(global-hl-line-mode)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(set-frame-font "Fira Code-14")
(tool-bar-mode -1)
(mac-auto-operator-composition-mode) ;; ->
(setq custom-file "~/.emacs.d/custom.el")

;; (setq-default mode-line-format
;; 	      '("%e"
;; 		mode-line-front-space
;; 		mode-line-mule-info
;;                 mode-line-client
;;                 mode-line-modified
;; 		mode-line-remote
;; 		mode-line-buffer-identification
;; 		mode-line-position
;; 		mode-line-modes))
;; (set-face-attribute 'mode-line nil :background "black")
;; (set-face-attribute 'mode-line nil :box '(:line-width 5 :color "black"))

(org-babel-load-file "~/.emacs.d/configuration.org")
;;; init.el ends here
