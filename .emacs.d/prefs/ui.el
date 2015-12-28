;; Line numbers
(global-linum-mode)
(setq linum-format "%4d ")

;; Hide menu bar
(menu-bar-mode -1)

;; Set color theme
(load-theme 'base16-default-dark t)
(add-to-list 'default-frame-alist '(background-color . "#111111"))

;; Hilight current line
(global-hl-line-mode)
