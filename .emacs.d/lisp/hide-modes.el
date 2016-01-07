;;; ngs-emacs/hide-modes --- Hide minor modes
;;;
;;; Commentary:
;;;
;;; Hides minor modes using diminish.el, replacing some
;;; with abbreviations
;;;
;;; Code:

(defmacro diminish-minor-mode (filename mode &optional abbrev)
  "After FILENAME has loaded, hide its corresponding MODE, displaying an optional ABBREV in its place."
  `(eval-after-load (symbol-name ,filename)
     '(diminish ,mode ,abbrev)))

(diminish-minor-mode 'undo-tree 'undo-tree-mode)
(diminish-minor-mode 'flycheck 'flycheck-mode "F")
(diminish-minor-mode 'company 'company-mode "c")
(diminish-minor-mode 'anzu 'anzu-mode)
(diminish-minor-mode 'yasnippet 'yas-minor-mode "y")

;;; hide-modes.el ends here
