(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.haml\\'" . web-mode))

(defun ngs-web-mode-hook ()
  "Hook for web-mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-markup-css-offset 2)
  (setq web-mode-markup-code-offset 2))

(add-hook 'web-mode-hook  'ngs-web-mode-hook)
