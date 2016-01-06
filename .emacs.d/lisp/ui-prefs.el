;;; ngs-emacs/ui-prefs --- User interface preferences

;;; Commentary:

;;; Preferences for user interface elements, e.g. tool bar,
;;; scroll bar, mode line

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
  (set-frame-font "InputMonoExtraLight-14"))

(defun ngs/customize-colors ()
  "Set up color theme."
  (load-theme 'base16-default-dark t))
  
(defun ngs/spaceline-mode-line ()
  "Configure mode line with spaceline."
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (setq powerline-default-separator 'wave)
  ;; TODO: What's up with the #?
  (add-hook 'after-init-hook #'fancy-battery-mode)
  ;; TODO: Why +1 and not t or 1?
  (global-anzu-mode +1)
  (fancy-battery-mode)
  (display-time-mode))

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

(global-hl-line-mode)

(ngs/fullscreen-on-macs)
(ngs/disable-window-chrome)
(ngs/set-font)
(ngs/customize-colors)
(ngs/spaceline-mode-line)
(ngs/relative-line-numbers)
(ngs/disable-srgb-colors-on-macs)
(ngs/use-pretty-symbols)

;;; ui-prefs.el ends here
