;; haxeflixel-mode.el --- Fundemaental major mode for HaxeFlixel
;;;
;;; Commentary:
;;;
;;; Simple editing mode for HaxeFlixel projects. Based on Funda HaXe
;;; Mode by Pierre Arlaud, and, in turn, Fundamental Mode.
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

(setq haxeflixel-namespace '("import" "package"))
(setq haxeflixel-class-def '("class" "interface" "enum" "typedef" "enum"))
(setq haxeflixel-scope-modifiers '("static" "public" "private" "override" "get" "set" "inline" "extern"))
(setq haxeflixel-accessors-scope '("get" "set" "default" "null" "never" "dynamic"))(setq haxeflixel-keywords '("for" "if" "switch" "while" "try" "catch" "do" "else" "case" "default"))
(setq haxeflixel-sub-keywords '("break" "continue" "return" "new" "in" "extends" "implements" "var" "function"))
(setq haxeflixel-constant-expressions '("false" "true" "null"))
(setq haxeflixel-primary-expressions '("this" "super"))

(setq haxeflixel-namespace-regexp (regexp-opt haxeflixel-namespace 'words))
(setq haxeflixel-class-def-regexp (regexp-opt haxeflixel-class-def 'words))
(setq haxeflixel-scope-modifiers-regexp (regexp-opt haxeflixel-scope-modifiers 'words))
(setq haxeflixel-accessors-scope-regexp (regexp-opt haxeflixel-accessors-scope 'words))
(setq haxeflixel-keywords-regexp (regexp-opt haxeflixel-keywords 'words))
(setq haxeflixel-sub-keywords-regexp (regexp-opt haxeflixel-sub-keywords 'words))
(setq haxeflixel-constant-expressions-regexp (regexp-opt haxeflixel-constant-expressions 'words))
(setq haxeflixel-primary-expressions-regexp (regexp-opt haxeflixel-primary-expressions 'words))
(setq haxeflixel-identifier-regexp "\\<\\([a-z][A-Za-z0-9_]*\\)\\>")
(setq haxeflixel-variable-regexp "\\<\\([A-Z_]*\\|[a-z][A-Za-z0-9_]*\\)\\>") ; constants support
(setq haxeflixel-classname-regexp "\\<\\([A-Z][A-Za-z0-9_]*\\)\\>")
(setq haxeflixel-function-def-param-regexp (concat haxeflixel-identifier-regexp "[ \t]*:"))
(setq haxeflixel-namespace-package-regexp (concat "import " haxeflixel-identifier-regexp))
(setq haxeflixel-var-def-regexp (concat "\\(var\\)[ \t]*" haxeflixel-variable-regexp))
(setq haxeflixel-function-def-regexp (concat "\\(function\\)[ \t]*" haxeflixel-identifier-regexp "?[ \t]*("))
(setq haxeflixel-anonymous-function-def-regexp "\\(function\\)[ \t]*(")

(defun haxeflixel-walk-argument-list ()
  "Walk into the arguments list as a pre-match form of a anchored font-lock"
  (save-excursion
    (goto-char (match-end 0))
    (backward-char)
    (ignore-errors
      (forward-sexp))
    (point))
  )

(setq haxeflixel-font-lock-keywords
      `(

	(,haxeflixel-namespace-regexp (0 font-lock-keyword-face)
				      (,haxeflixel-identifier-regexp nil nil (0 font-lock-constant-face)))

	(,haxeflixel-var-def-regexp (1 font-lock-keyword-face) (2 font-lock-variable-name-face)
				    (,haxeflixel-accessors-scope-regexp nil nil (0 font-lock-constant-face)))

	
	(,haxeflixel-function-def-regexp (1 font-lock-keyword-face) (2 font-lock-function-name-face)
					 (,haxeflixel-function-def-param-regexp
					  (haxeflixel-walk-argument-list)
					  (goto-char (match-end 0))
					  (1 font-lock-variable-name-face)))

	(,haxeflixel-anonymous-function-def-regexp (1 font-lock-keyword-face)
						   (,haxeflixel-function-def-param-regexp
						    (haxeflixel-walk-argument-list)
						    (goto-char (match-end 0))
						    (1 font-lock-variable-name-face)))
	
	(,haxeflixel-classname-regexp . font-lock-type-face)
	(,haxeflixel-class-def-regexp . font-lock-keyword-face)
	(,haxeflixel-scope-modifiers-regexp . font-lock-keyword-face)
	(,haxeflixel-keywords-regexp . font-lock-keyword-face)
	(,haxeflixel-sub-keywords-regexp . font-lock-keyword-face)
	(,haxeflixel-primary-expressions-regexp . font-lock-keyword-face)
	(,haxeflixel-constant-expressions-regexp . font-lock-constant-face)
	))


(defvar haxeflixel-mode-syntax-table
  (let ((haxeflixel-mode-syntax-table (make-syntax-table)))
    (modify-syntax-entry ?/ ". 124b" haxeflixel-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" haxeflixel-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" haxeflixel-mode-syntax-table)
    (modify-syntax-entry ?' "\"" haxeflixel-mode-syntax-table)
    haxeflixel-mode-syntax-table)
  "Syntax table for haxeflixel-mode")

(defvar haxeflixel-indent-offset 4
  "Indentation offset for `haxeflixel-mode'.")
(defun haxeflixel-indent-line ()
  "Indent current line for `haxeflixel-mode'."
  (interactive)
  (let ((indent-col 0))
    (save-excursion
      (beginning-of-line)
      (condition-case nil
	  (while t
	    (backward-up-list 1)
	    (when (looking-at "[([{]")
	      (setq indent-col (+ indent-col haxeflixel-indent-offset))))
	(error nil)))
    (save-excursion
      (back-to-indentation)
      (when (and (looking-at "[]})]") (>= indent-col haxeflixel-indent-offset))
	(setq indent-col (- indent-col haxeflixel-indent-offset))))

    (let* ((parse-status
	    (save-excursion (syntax-ppss (point-at-bol))))
	   (offset (- (point) (save-excursion (back-to-indentation) (point)))))
      (indent-line-to indent-col)
      (when (> offset 0) (forward-char offset)))))

(setq electric-indent-chars
      (append "[]{}():;," electric-indent-chars))
(setq electric-layout-rules
      '((?\; . after) (?\{ . after) (?\} . before)))

(defun parent-directory (dir)
  (unless (equal "/" dir)
    (file-name-directory (directory-file-name dir))))

(defun find-file-in-heirarchy (current-dir fname)
  "Search for a file named FNAME upwards through the directory hierarchy, starting from CURRENT-DIR" 
  (let ((file (concat current-dir fname))
        (parent (parent-directory (expand-file-name current-dir))))
    (if (file-exists-p file)
        file
      (when parent
        (find-file-in-heirarchy parent fname)))))

(defun haxeflixel-get-project-xml ()
  "Get the Project.xml for the current HaxeFlixel."
  (find-file-in-heirarchy (
			   buffer-file-name (window-buffer (minibuffer-selected-window)))
			  "Project.xml"))

(defun haxeflixel-test  (&optional target)
  "Test the current HaxeFlixel project."
  (interactive)
  (start-process "lime"
		 (get-buffer-create "*haxeflixel*")
		 "/usr/local/bin/lime"
		 "test"
		 (haxeflixel-get-project-xml)
		 (if (null target) "flash" target)))
  
(define-derived-mode haxeflixel-mode fundamental-mode
  "Fundamental Major mode for Haxeflixel"
  (kill-all-local-variables)
  (interactive)
  (setq font-lock-defaults '((haxeflixel-font-lock-keywords)))
  (set-syntax-table haxeflixel-mode-syntax-table)
  (set (make-local-variable 'indent-line-function) 'haxeflixel-indent-line)
  (set (make-local-variable 'comment-start) "//")
  (set (make-local-variable 'comment-end) "")
  (setq major-mode 'haxeflixel-mode
	mode-name "HaxeFlixel"
	local-abbrev-table haxeflixel-mode-abbrev-table
	abbrev-mode t)
  )

(add-to-list 'auto-mode-alist '("\\.hx\\'" . haxeflixel-mode))

(provide 'haxeflixel-mode)
