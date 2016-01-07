;;; ngs-emacs/keybindings --- Custom keybindings

;;; Commentary:

;;; Custom keybindings

;;; Code:

(load "setup-keys.el")

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x g") 'magit-status)
(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;;; keybindings.el ends here
