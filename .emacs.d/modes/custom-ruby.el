(add-hook 'ruby-mode-hook
	  (lambda ()
	    (projectile-rails-mode)
	    rspec-mode))

;; (require 'rcodetools)
;; (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)
