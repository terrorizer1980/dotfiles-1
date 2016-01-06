;;; ngs-emacs/custom-company --- Configuration for company-mode

;;; Commentary:

;;; Configuration for company-mode

;;; Code:

(add-hook 'after-init-hook (global-company-mode))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))

;;; custom-company.el ends here
