;;; ngs-emacs/auto-modes --- File type to mode mapping
;;;
;;; Copyright (c) 2016 Nicholas Scheurich
;;;
;;; Commentary:
;;;
;;; Automatically loads modes when editing a file, based on the file's
;;; type.
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

(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.haml\\'" . haml-mode))
(add-to-list 'auto-mode-alist '("\\.hx\\'" . haxeflixel-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; http://stackoverflow.com/questions/6886643/file-extension-hook-in-emacs
(defun ngs/use-projectile-rails-mode-for-erb ()
  "Enables projectile-rails-mode when editing ERB files."
  (when (and (stringp buffer-file-name)
             (string-match "\\.erb\\'" buffer-file-name))
    (projectile-rails-mode)))

(defun ngs/use-rspec-mode-for-erb ()
  "Enables rspec-mode when editing ERB files."
  (when (and (stringp buffer-file-name)
             (string-match "\\.erb\\'" buffer-file-name))
    (rspec-mode)))

(defun ngs/use-projectile-rails-mode-for-haml ()
  "Enables projectile-rails-mode when editing HAML files."
  (when (and (stringp buffer-file-name)
             (string-match "\\.haml\\'" buffer-file-name))
    (projectile-rails-mode)))

(defun ngs/use-rspec-mode-for-haml ()
  "Enables rspec-mode when editing HAML files."
  (when (and (stringp buffer-file-name)
             (string-match "\\.haml\\'" buffer-file-name))
    (rspec-mode)))

(add-hook 'find-file-hook 'ngs/use-projectile-rails-mode-for-haml)
(add-hook 'find-file-hook 'ngs/use-rspec-mode-for-haml)
(add-hook 'find-file-hook 'ngs/use-projectile-rails-mode-for-erb)
(add-hook 'find-file-hook 'ngs/use-rspec-mode-for-erb)

;;; auto-modes.el ends here
