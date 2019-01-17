;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(setq display-line-numbers-type 'relative)

(setq doom-font (font-spec :family "Iosevka" :size 13)
      doom-big-font (font-spec :family "Iosevka" :size 24))

(setq mac-auto-operator-composition-mode t)

(def-package! prettier-js
  :init
  (add-hook! 'web-mode-hook 'prettier-js-mode))
