
(setq user-full-name "Nicholas Gunther Scheurich"
      user-mail-address "nick@scheurich.me")

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Fira Code"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.45)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native 1
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols t
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers nil
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode nil
   dotspacemacs-smart-closing-parenthesis nil
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  )

(defun ngs/configuration-layers ()
    '(
      ;; Checkers
      syntax-checking

      ;; Completion
      (auto-completion :variables
                       auto-completion-enable-snippets-in-popup t
                       auto-completion-complete-with-key-sequence "jk")

      ;; Emacs
      org

      ;; Frameworks
      ruby-on-rails

      ;; Languages
      c-c++ csharp clojure elixir emacs-lisp haskell html javascript markdown
      typescript php ruby shell-scripts sql typescript yaml

      ;; Source control
      git github version-control

      ;; Tools
      dash ranger restclient
      (shell :variables
             shell-default-height 30
             shell-default-position 'bottom)

      ;; Web services
      spotify))

(defun ngs/additional-packages ()
  '())
(defun ngs/frozen-packages ()
  '())
(defun ngs/excluded-packages ()
  '())

(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution              'spacemacs
   dotspacemacs-enable-lazy-installation  'unused
   dotspacemacs-ask-for-lazy-installation t
   dotspacemacs-configuration-layer-path  '()
   dotspacemacs-configuration-layers      (ngs/configuration-layers)
   dotspacemacs-additional-packages       (ngs/additional-packages)
   dotspacemacs-frozen-packages           (ngs/frozen-packages)
   dotspacemacs-excluded-packages         (ngs/excluded-packages)
   dotspacemacs-install-packages          'used-only))

(defun ngs/user-configuration-emacs ()
  (setq-default
   custom-file "~/.emacs.d/private/custom.el"
   dotspacemacs-persistent-server t))

(defun ngs/user-configuration-ui ()
  (setq-default
   neo-theme 'ascii
   powerline-default-separator 'slant)

  (global-linum-mode)
  (linum-relative-mode)
  (mac-auto-operator-composition-mode))

(defun ngs/user-configuration-keybindings ()
  ;; Use +/-/0 to zoom the frame in and out.
  (global-unset-key (kbd "C-x C-="))
  (global-set-key (kbd "C-x C-=") 'spacemacs/zoom-frm-in)
  (global-unset-key (kbd "C-x C--"))
  (global-set-key (kbd "C-x C--") 'spacemacs/zoom-frm-out)
  (global-unset-key (kbd "C-x C-0"))
  (global-set-key (kbd "C-x C-0") 'spacemacs/zoom-frm-unzoom))

(defun dotspacemacs/user-config ()
  (ngs/user-configuration-emacs)
  (ngs/user-configuration-ui)
  (ngs/user-configuration-keybindings)

  (defun ngs/smartparens-toggle ()
    (interactive)
    (if (bound-and-true-p smartparens-mode)
        (ngs/smartparens-mode-disable)
      (ngs/smartparens-mode-enable)))
  (defun ngs/smartparens-mode-disable ()
    (smartparens-mode -1)
    (message "smartparens-mode disabled"))
  (defun ngs/smartparens-mode-enable ()
    (smartparens-mode)
    (message "smartparens-mode enabled"))
  (define-key evil-insert-state-map (kbd "M-p") 'ngs/smartparens-toggle)


  (load custom-file)
  (spaceline-compile))
