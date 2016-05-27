;;; ngs-emacs/keybindings --- Custom keybindings
;;;
;;; Copyright (c) 2016 Nicholas Scheurich
;;;
;;; Commentary:
;;;
;;; Custom keybindings
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

(load "setup-keys.el")

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x g") 'magit-status)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)
(global-evil-surround-mode 1)
;; (define-key haskell-mode-map (kbd "<f8>") 'haskell-navigate-imports)
(define-key ruby-mode-map (kbd "C-c C-c") 'xmp)

;;; keybindings.el ends here
