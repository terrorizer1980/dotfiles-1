;;; ngs/dotfiles --- My Emacs config
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
;;; Commentary:
;;; My Emacs initialization file.
;;;
;;; Code:

(defun ngs/configure-cask ()
  (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
  (cask-initialize)
  (require 'pallet)
  (pallet-mode t))

(defun ngs/include-custom-code-paths ()
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (add-to-list 'load-path "~/.emacs.d/modes/"))

(defun hrs/configure-all-custom-modes ()
  (mapcar (lambda (mode-file-name) (load mode-file-name))
          (directory-files "~/.emacs.d/modes/" nil ".el")))

(defun ngs/extend-exec-path ()
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (setq exec-path (append exec-path '("~/.rbenv/shims"))))

(setq custom-file "~/.emacs.d/custom.el")
(setq system-uses-terminfo nil)

(ngs/configure-cask)
(ngs/extend-exec-path)
(ngs/include-custom-code-paths)

(hrs/configure-all-custom-modes)

(evil-mode t) ;; ❤ Vim

(load "utils.el")
(load "ui-prefs.el")
(load "keybindings.el")

(add-hook 'after-init-hook
	  (lambda ()
	    (global-discover-mode)
	    (global-company-mode)
	    (global-flycheck-mode)))

(load custom-file)

(provide 'init)
;;; init.el ends here 
