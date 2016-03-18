(require 'haxe-mode)

(defconst my-haxe-style
  '("java" (c-offsets-alist . ((case-label . +)
			       (arglist-intro . +)
			       (arglist-cont-nonempty . 0)
			       (arglist-close . 0)
			       (cpp-macro . 0)))))

(add-hook 'haxe-mode-hook
	  (function (lambda () (c-add-style "haxe" my-haxe-style t))))

(add-hook 'haxe-mode-hook
	  (function
	   (lambda ()
	     (setq tab-width 4)
	     (setq indent-tabs-mode t)
	     (setq fill-column 80)
	     (local-set-key [(return)] 'newline-and-indent))))
