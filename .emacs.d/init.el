;;; ngs-emacs/init --- My Emacs config
;;;
;;; Copyright (c) 2016 Nicholas Scheurich
;;;
;;; Commentary:
;;;
;;; My Emacs initialization file. Opinions are my own. Vim, you will
;;; always be my first ❤. Lots of good stuff lifted from the Emacs
;;; setup of Mr. Harry R. Schwartz <http://harryrschwartz.com/>.
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

(defun ngs/configure-cask ()
  "Set up Cask and Pallet."
  (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
  (cask-initialize)
  (require 'pallet)
  (pallet-mode t))

(defun ngs/include-custom-code-paths ()
  "Allow easy file loading by filename."
  (add-to-list 'load-path "~/.emacs.d/lisp/")
  (add-to-list 'load-path "~/.emacs.d/modes/"))

(defun ngs/configure-all-custom-modes ()
  "Load configuration for each custom-mode.el in the modes directory."
  (mapcar (lambda (mode-file-name) (load mode-file-name))
          (directory-files "~/.emacs.d/modes/" nil ".el")))

(defun ngs/extend-exec-path ()
  "Add additional places for Emacs to hunt down executables."
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (setq exec-path (append exec-path '("~/.rbenv/shims"))))

(defun ngs/configure-yasnippet ()
  "Load up YASnippet and define snippet directories."
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"
	  "~/.emacs.d/snippets/yasnippet-snippets"))
  (yas-global-mode 1))

(defun ngs/configure-terminal ()
  "Gotta have my terminal."
  (setq multi-term-program "/bin/zsh"))

(setq custom-file "~/.emacs.d/custom.el")
(setq system-uses-terminfo nil)

(ngs/configure-cask)
(ngs/extend-exec-path)
(ngs/include-custom-code-paths)
(ngs/configure-all-custom-modes)
(ngs/configure-yasnippet)

(load "utils.el")
(load "ui-prefs.el")
(load "keybindings.el")

(load custom-file)

;;; init.el ends here
