(add-hook 'ruby-mode-hook
	  (lambda () (projectile-rails-mode 1)))

(add-hook 'ruby-mode-hook
	  (lambda () (rspec-mode 1)))

;; (require 'rcodetools)
;; (define-key ruby-mode-map (kbd "C-c C-c") 'xmp)
