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

(org-babel-load-file "~/.emacs.d/configuration.org")

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package magit
  :ensure t)

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

(use-package rainbow-delimiters
  :ensure t
  :init (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

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

(use-package clojure-mode
  :ensure t
  :mode ("\\.clj'" "\\.cljs'"))
(use-package cider
  :ensure t)

(use-package paredit
  :ensure t
  :mode("\\.lisp'"
	"\\.el'"
	"\\.clj'"
	"\\.cljs'"))

(use-package which-key
  :ensure t
  :diminish which-key-mode
  :config (which-key-mode 1))

(use-package smartparens
  :ensure t
  :diminish smartparens-mode
  :config (smartparens-mode 1))

(use-package spaceline-config
  :ensure spaceline
  :config
  (spaceline-helm-mode)
  (setq powerline-default-separator nil)
  (spaceline-compile
   'ngs
   '((window-number)
     (buffer-modified buffer-size buffer-id)
     major-mode
     (process :when active)
     ((flycheck-error flycheck-warning flycheck-info)
      :when active)
     version-control
     (minor-modes :when active))
   '((buffer-encoding-abbrev "|" line-column)
     buffer-position))
  (setq-default mode-line-format '("%e" (:eval (spaceline-ml-ngs)))))

(defun ngs/config-solarized-modeline (bg fg bg2)
  "Set modeline colors.  BG is the background and FG is the foreground.
BG2 is the inactive modeline."
  (set-face-attribute 'mode-line nil :box `(:line-width 3 :color ,bg))
  (set-face-attribute 'mode-line nil :background fg)
  (set-face-attribute 'mode-line nil :foreground bg)
  (set-face-attribute 'modeline-inactive nil :box `(:line-width 3 :color ,bg2))
  (set-face-attribute 'modeline-inactive nil :background fg)
  (set-face-attribute 'modeline-inactive nil :foreground bg2))

(defun ngs/config-solarized-powerline (bg fg bg2 fg2)
  "Set Powerline colors.  BG is the background color and FG is the foreground.
BG2 and FG2 are for the inactive modeline."
  (set-face-attribute 'powerline-active1 nil :background fg)
  (set-face-attribute 'powerline-active2 nil :background fg)
  (set-face-attribute 'powerline-active1 nil :foreground bg)
  (set-face-attribute 'powerline-active2 nil :foreground bg)
  (set-face-attribute 'powerline-inactive1 nil :background fg2)
  (set-face-attribute 'powerline-inactive2 nil :background fg2)
  (set-face-attribute 'powerline-inactive1 nil :foreground bg2)
  (set-face-attribute 'powerline-inactive2 nil :foreground bg2))
 
(defun ngs/config-solarized-flycheck (bg error warning info)
  "Set Spaceline Flycheck colors.  BG is the background color.
ERROR, WARNING, and INFO are the foreground colors for their respective Flycheck outputs."
    (set-face-attribute 'spaceline-flycheck-error   nil :distant-foreground bg)
    (set-face-attribute 'spaceline-flycheck-warning nil :distant-foreground bg)
    (set-face-attribute 'spaceline-flycheck-info    nil :distant-foreground bg)
    (set-face-attribute 'spaceline-flycheck-error   nil :foreground bg)
    (set-face-attribute 'spaceline-flycheck-warning nil :foreground bg)
    (set-face-attribute 'spaceline-flycheck-info    nil :foreground bg)
    (set-face-attribute 'spaceline-flycheck-error   nil :background error)
    (set-face-attribute 'spaceline-flycheck-warning nil :background warning)
    (set-face-attribute 'spaceline-flycheck-info    nil :background info))

(defun ngs/config-solarized-theme (mode)
  "Enable a Solarized 'light or 'dark MODE."
  (set-frame-parameter nil 'background-mode mode)
  (enable-theme 'solarized)
  (let ((modeline-bg       (if (eq mode 'dark) "#00232a" "#e9e1c8"))
	(modeline-fg1      (if (eq mode 'dark) "#93a1a1" "#657b83"))
	(modeline-fg2      (if (eq mode 'dark) "#2aa198" "#2aa198"))
	(flycheck-error    (if (eq mode 'dark) "#d33682" "#d33682"))
	(flycheck-warning  (if (eq mode 'dark) "#b58900" "#b58900"))
	(flycheck-info     (if (eq mode 'dark) "#268bd2" "#2628bd"))
	(fringe            (if (eq mode 'dark) "#002b36" "#fdf6e3"))
	(linum-current-bg  (if (eq mode 'dark) "#073642" "#eee8d5"))
	(linum-current-fg  (if (eq mode 'dark) "#859900" "#859900")))
    (set-face-attribute 'fringe nil :background fringe)
    (set-face-attribute 'linum-relative-current-face nil :background linum-current-bg)
    (set-face-attribute 'linum-relative-current-face nil :foreground linum-current-fg)
    (ngs/config-solarized-modeline modeline-bg modeline-fg1 linum-current-bg)
    (ngs/config-solarized-powerline modeline-bg modeline-fg2 linum-current-bg modeline-fg1)
    (ngs/config-solarized-flycheck modeline-bg flycheck-error flycheck-warning flycheck-info)))

(defun ngs/solarized-toggle ()
  "Toggle between light and dark Solarized themes."
  (interactive)
  (ngs/config-solarized-theme
   (if (eq (frame-parameter nil 'background-mode) 'light) 'dark 'light)))

(defvar color-themes)
(use-package color-theme-solarized
  :ensure t
  :init (setq color-themes '())
  :config (progn (load-theme 'solarized)
		 (ngs/config-solarized-theme 'dark)))

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
;;; init.el ends here
