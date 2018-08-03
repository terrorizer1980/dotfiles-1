;; -*- mode: emacs-lisp -*-

;;; .spacemacs --- My Spacemacs config
;;;
;;; Commentary:
;;;
;;; There be dragons here.
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

(org-babel-load-file "~/.emacs.d/private/configuration.org")

;;; .spacemacs ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (zerodark-theme yaml-mode web-mode tide typescript-mode tagedit sql-indent spotify slim-mode scss-mode sass-mode rvm ruby-tools ruby-test-mode rubocop rspec-mode robe reveal-in-osx-finder restclient-helm rbenv ranger pug-mode projectile-rails rake phpunit phpcbf php-auto-yasnippets pbcopy osx-trash osx-dictionary omnisharp shut-up ob-restclient ob-http ob-elixir minitest magit-gh-pulls launchctl intero insert-shebang hlint-refactor hindent helm-spotify-plus multi helm-hoogle helm-dash helm-css-scss helm-company helm-c-yasnippet haskell-snippets haml-mode github-search github-clone github-browse-file gist gh marshal logito pcache ht fuzzy flycheck-mix flycheck-haskell flycheck-credo fish-mode feature-mode emmet-mode drupal-mode php-mode disaster dash-at-point csharp-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-restclient restclient know-your-http-well company-ghci company-ghc ghc haskell-mode company-cabal company-c-headers cmm-mode cmake-mode clojure-snippets clj-refactor inflections edn paredit peg clang-format cider-eval-sexp-fu cider sesman queue clojure-mode chruby bundler inf-ruby auto-yasnippet auto-complete all-the-icons memoize alchemist company elixir-mode xterm-color ws-butler winum which-key web-beautify volatile-highlights vi-tilde-fringe uuidgen use-package unfill toc-org spaceline smeargle shell-pop restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox orgit org-projectile org-present org-pomodoro org-mime org-download org-bullets open-junk-file neotree mwim multi-term move-text mmm-mode markdown-toc magit-gitflow macrostep lorem-ipsum livid-mode linum-relative link-hint json-mode js2-refactor js-doc indent-guide hungry-delete htmlize hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-gitignore helm-flx helm-descbinds helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe git-gutter-fringe+ gh-md flycheck-pos-tip flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu eshell-z eshell-prompt-extras esh-help elisp-slime-nav dumb-jump diminish diff-hl define-word column-enforce-mode coffee-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
