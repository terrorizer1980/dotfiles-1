;;; ngs-emacs/ui-prefs --- User interface preferences
;;;
;;; Commentary:
;;;
;;; Preferences for user interface elements, e.g. tool bar,
;;; scroll bar, mode line
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

(load "hide-modes.el")

(defun ngs/fullscreen-on-macs ()
  "Make Emacs fullscreen on Macs."
  (when (hrs/mac?)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(defun ngs/disable-window-chrome ()
  "Disable unnecessary window chrome."
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun ngs/set-font ()
  "Set default font."
  (set-frame-font "Input-13"))
  ;;(set-frame-font "Fantasque Sans Mono-16"))

(defun ngs/customize-colors ()
  "Set up color theme."
  (load-theme 'base16-default-dark t))
  ;; (load-theme 'gruvbox t))
  
(defun ngs/configure-mode-line ()
  "Configure mode line."
  ;; (require 'spaceline-config)
  ;; (spaceline-spacemacs-theme)
  ;; (spaceline-helm-mode)
  ;; (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  ;; (setq powerline-default-separator 'slant)
  ;; (setq spaceline-minor-modes-separator " ")
  ;; TODO: What's up with the #?
  ;; (add-hook 'after-init-hook #'fancy-battery-mode)
  ;; TODO: Why +1 and not t or 1?
  (global-anzu-mode +1)
  ;; (setq spaceline-window-numbers-unicode t)
  ;; (fancy-battery-mode)
  ;; (display-time-mode)
  ;; (sml/setup)
  (setq column-number-mode t)
  (window-numbering-mode))

(defun ngs/configure-ido ()
  ;; (ido-everywhere 1)
  (ido-vertical-mode 1)
  (flx-ido-mode 1)
  (setq ido-enable-flex-matching t)
  (setq ido-use-faces nil))

(defun ngs/relative-line-numbers ()
  "Turn on relative line numbers à la Vim."
  (require 'linum-relative)
  (global-linum-mode)
  (linum-relative-on))

(defun ngs/disable-srgb-colors-on-macs ()
  "Fix spaceline/powerline colors on Macs."
  (when (hrs/mac?)
    (setq ns-use-srgb-colorspace nil)))

(defun ngs/use-pretty-symbols ()
  "Use pretty symbols, e.g. lambda becomes λ."
  (global-prettify-symbols-mode t))

(defun ngs/enable-visible-bell ()
  "Turn on the visible bell; cut out all that dingin'!"
  (setq visible-bell t))

(global-hl-line-mode)

;; (ngs/fullscreen-on-macs)
(ngs/disable-window-chrome)
(ngs/set-font)
(ngs/customize-colors)
(ngs/configure-mode-line)
(ngs/relative-line-numbers)
(ngs/disable-srgb-colors-on-macs)
(ngs/use-pretty-symbols)
(ngs/configure-ido)

(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;;; ui-prefs.el ends here
