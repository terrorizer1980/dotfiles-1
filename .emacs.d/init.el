;; Much gratitude to  Harry R. Schwartz <http://harryrschwartz.com/>
;; for sensible-defaults.el as well as inspiration and code for
;; this setup.

(load-file "~/code/ext/sensible-defaults.el/sensible-defaults.el")
(sensible-defaults/use-all-settings)
(sensible-defaults/use-all-keybindings)

(defun ngs/configure-cask ()
  (require 'cask "/usr/local/share/emacs/site-lisp/cask/cask.el")
  (cask-initialize)
  (require 'pallet)
  (pallet-mode t))

(defun ngs/include-code-paths ()
  (add-to-list 'load-path "~/.emacs.d/prefs")
  (add-to-list 'load-path "~/.emacs.d/modes"))

(defun ngs/configure-modes ()
  (mapcar (lambda (mode-file-name) (load mode-file-name))
	  (directory-files "~/.emacs.d/modes" nil ".el")))

(custom-set-variables
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" default))))

(ngs/include-code-paths)
(ngs/configure-cask)

(load "ui.el")
(load "keybindings.el")

(load-file "~/.emacs.d/prefs/smart-mode-line.el")

(ngs/configure-modes)
