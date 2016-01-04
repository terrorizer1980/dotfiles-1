(add-hook 'ruby-mode-hook
	  (lambda ()
	    (projectile-rails-mode)
	    rspec-mode))
