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

(org-babel-load-file "~/.emacs.d/configuration.org")

(use-package markdown-mode
  :ensure t
  :commands (markdown-mode gfm-mode)
  :mode (("README\\.md\\'" . gfm-mode)
         ("\\.md\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode)))

(use-package magit
  :ensure t)

(defvar linum-relative-format)
(use-package linum-relative
  :ensure t
  :diminish linum-relative-mode
  :init (setq linum-relative-format "%4s ")
  :config (linum-relative-global-mode))

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

(setq custom-file "~/.emacs.d/custom.el")
;;; init.el ends here
