;;; ngs-emacs/hide-modes --- Hide minor modes
;;;
;;; Commentary:
;;;
;;; Hides minor modes using diminish.el, replacing some
;;; with abbreviations.
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

(defmacro diminish-minor-mode (filename mode &optional abbrev)
  "After FILENAME has loaded, hide its corresponding MODE, displaying an optional ABBREV in its place."
  `(eval-after-load (symbol-name ,filename)
     '(diminish ,mode ,abbrev)))

(diminish-minor-mode 'anzu 'anzu-mode)
(diminish-minor-mode 'company 'company-mode)
(diminish-minor-mode 'undo-tree 'undo-tree-mode)
(diminish-minor-mode 'which-key 'which-key-mode)

;; (diminish-minor-mode 'flycheck 'flycheck-mode "Ⓕ")
;; (diminish-minor-mode 'projectile-rails 'projectile-rails-mode "Ⓡ")
;; (diminish-minor-mode 'yasnippet 'yas-minor-mode "ⓨ")

(diminish-minor-mode 'flycheck 'flycheck-mode " F")
(diminish-minor-mode 'projectile-rails 'projectile-rails-mode " Rails")
(diminish-minor-mode 'yasnippet 'yas-minor-mode " y")

;;; hide-modes.el ends here
