(defun hrs/fullscreen-on-macs ()
  (when (hrs/mac?)
    (set-frame-parameter nil 'fullscreen 'fullboth)))

(defun ngs/disable-window-chrome ()
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1))

(defun ngs/set-font ()
  (set-frame-font "InputMonoExtraLight-14"))

(defun ngs/customize-colors ()
  (load-theme 'base16-default-dark t))
  
(defun ngs/spaceline-mode-line ()
  (require 'spaceline-config)
  (spaceline-spacemacs-theme)
  (spaceline-helm-mode)
  ;; TODO: What's up with the #?
  (add-hook 'after-init-hook #'fancy-battery-mode)
  ;; TODO: Why +1 and not t or 1?
  (global-anzu-mode +1)
  ;; (window-numbering-mode)
  (fancy-battery-mode)
  (setq powerline-default-separator 'wave)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (display-time-mode))

(defun ngs/smart-mode-line ()
  (sml/setup)
  (setq sml/theme 'respectful)
  (rich-minority-mode 1)
  (add-to-list 'sml/replacer-regexp-list '("^~/code/" ":CODE:") t)
  (display-time-mode))

(defun ngs/relative-line-numbers ()
  (require 'linum-relative)
  (global-linum-mode)
  (linum-relative-on))

(defun ngs/disable-srgb-colors-on-mac ()
  (when (hrs/mac?)
    (setq ns-use-srgb-colorspace nil)))

(global-hl-line-mode)

(hrs/fullscreen-on-macs)
(ngs/disable-window-chrome)
(ngs/set-font)
(ngs/customize-colors)
(ngs/spaceline-mode-line)
;; (ngs/smart-mode-line)
(ngs/relative-line-numbers)
(ngs/disable-srgb-colors-on-mac)
