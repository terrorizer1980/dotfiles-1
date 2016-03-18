(c-add-style "ngs"
	     '("k&r"
	       (c-basic-offset . 4)
	       (c-offsets-alist . (
				   (statement-case-open  . 0)
				   (case-label . 0)
				   (substatement-open . 0)
				   ))))

(defun ngs/c-style ()
  (c-set-style "ngs")
  (setq indent-tabs-mode nil))

(add-hook 'c-mode-hook 'ngs/c-style)
